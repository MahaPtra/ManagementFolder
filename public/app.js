const API_URL = 'http://localhost:3000/api';

let allFiles = [];
let currentFiles = [];
let selectedFolder = null;

// Initialize app
document.addEventListener('DOMContentLoaded', () => {
    // App will start with folder selection screen
    // loadFiles will be called after folder selection
});

// Select folder
function selectFolder(folder) {
    selectedFolder = folder;
    document.getElementById('folderSelection').style.display = 'none';
    document.getElementById('mainApp').style.display = 'block';
    
    // Update header
    const folderNames = {
        'folderMaha': 'Folder Maha',
        'folderReva': 'Folder Reva'
    };
    document.getElementById('currentFolderName').textContent = folderNames[folder];
    document.getElementById('currentFolderLabel').textContent = folderNames[folder];
    document.getElementById('folderStatsName').textContent = folderNames[folder];
    
    loadFiles();
    setupEventListeners();
}

// Back to folder selection
function backToSelection() {
    selectedFolder = null;
    allFiles = [];
    currentFiles = [];
    document.getElementById('folderSelection').style.display = 'flex';
    document.getElementById('mainApp').style.display = 'none';
    document.getElementById('searchInput').value = '';
    document.getElementById('typeFilter').value = '';
}

// Setup event listeners
function setupEventListeners() {
    const searchBtn = document.getElementById('searchBtn');
    const searchInput = document.getElementById('searchInput');
    const typeFilter = document.getElementById('typeFilter');

    searchBtn.addEventListener('click', handleSearch);
    searchInput.addEventListener('keyup', (e) => {
        if (e.key === 'Enter') {
            handleSearch();
        }
    });
    typeFilter.addEventListener('change', handleSearch);
}

// Load all files
async function loadFiles() {
    try {
        const response = await fetch(`${API_URL}/files`);
        const data = await response.json();
        
        if (data.success) {
            // Filter files by selected folder
            allFiles = data.files.filter(file => file.folder === selectedFolder);
            currentFiles = allFiles;
            await loadFileTypes();
            displayFiles(currentFiles);
            updateStats();
        }
    } catch (error) {
        console.error('Error loading files:', error);
        showError('Gagal memuat file. Pastikan server berjalan.');
    }
}

// Load file types for filter
async function loadFileTypes() {
    try {
        const response = await fetch(`${API_URL}/types`);
        const data = await response.json();
        
        if (data.success) {
            const typeFilter = document.getElementById('typeFilter');
            typeFilter.innerHTML = '<option value="">Semua Jenis</option>';
            
            Object.keys(data.types).sort().forEach(type => {
                const option = document.createElement('option');
                option.value = type;
                option.textContent = `${type} (${data.types[type]})`;
                typeFilter.appendChild(option);
            });
        }
    } catch (error) {
        console.error('Error loading types:', error);
    }
}

// Handle search
async function handleSearch() {
    const searchQuery = document.getElementById('searchInput').value.trim();
    const typeFilter = document.getElementById('typeFilter').value;
    
    try {
        const params = new URLSearchParams();
        if (searchQuery) params.append('q', searchQuery);
        if (typeFilter) params.append('type', typeFilter);
        
        const response = await fetch(`${API_URL}/search?${params}`);
        const data = await response.json();
        
        if (data.success) {
            currentFiles = data.files;
            displayFiles(currentFiles);
            updateStats();
        }
    } catch (error) {
        console.error('Error searching:', error);
        showError('Gagal melakukan pencarian.');
    }
}

// Display files grouped by type
function displayFiles(files) {
    const fileGroupsContainer = document.getElementById('fileGroups');
    
    if (files.length === 0) {
        fileGroupsContainer.innerHTML = '<div class="no-files">Tidak ada file ditemukan.</div>';
        return;
    }
    
    // Group files by type
    const grouped = files.reduce((acc, file) => {
        if (!acc[file.type]) {
            acc[file.type] = [];
        }
        acc[file.type].push(file);
        return acc;
    }, {});
    
    // Generate HTML
    let html = '';
    Object.keys(grouped).sort().forEach(type => {
        html += generateFileGroup(type, grouped[type]);
    });
    
    fileGroupsContainer.innerHTML = html;
}

// Generate HTML for a file group
function generateFileGroup(type, files) {
    const badgeClass = `badge-${type.toLowerCase()}`;
    
    let html = `
        <div class="file-group">
            <div class="group-header">
                <h2>${type}</h2>
                <span class="group-count">${files.length} file${files.length > 1 ? 's' : ''}</span>
            </div>
            <div class="file-list">
    `;
    
    files.forEach(file => {
        const fileSize = formatFileSize(file.size);
        const fileDate = formatDate(file.modified);
        
        html += `
            <div class="file-item">
                <div class="file-info">
                    <div class="file-name">${escapeHtml(file.name)}</div>
                    <div class="file-meta">
                        <span><span class="badge ${badgeClass}">${file.type}</span></span>
                        <span>📁 ${file.folder}</span>
                        <span>📊 ${fileSize}</span>
                        <span>📅 ${fileDate}</span>
                    </div>
                </div>
                <div class="file-actions">
                    <button class="download-btn" onclick="downloadFile('${file.folder}', '${escapeHtml(file.name)}')">
                        ⬇️ Download
                    </button>
                </div>
            </div>
        `;
    });
    
    html += `
            </div>
        </div>
    `;
    
    return html;
}

// Download file
function downloadFile(folder, filename) {
    const url = `${API_URL}/download/${folder}/${encodeURIComponent(filename)}`;
    window.location.href = url;
}

// Update statistics
function updateStats() {
    const total = currentFiles.length;
    document.getElementById('totalFiles').textContent = total;
}

// Format file size
function formatFileSize(bytes) {
    if (bytes === 0) return '0 Bytes';
    
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
}

// Format date
function formatDate(dateString) {
    const date = new Date(dateString);
    const options = { 
        year: 'numeric', 
        month: 'short', 
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    };
    return date.toLocaleDateString('id-ID', options);
}

// Escape HTML to prevent XSS
function escapeHtml(text) {
    const map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };
    return text.replace(/[&<>"']/g, m => map[m]);
}

// Show error message
function showError(message) {
    const fileGroupsContainer = document.getElementById('fileGroups');
    fileGroupsContainer.innerHTML = `<div class="no-files">⚠️ ${message}</div>`;
}
