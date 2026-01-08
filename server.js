const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Folders to manage
const FOLDERS = {
  folderMaha: path.join(__dirname, 'assets', 'folderMaha'),
  folderReva: path.join(__dirname, 'assets', 'folderReva')
};

// Get file extension
function getFileExtension(filename) {
  return path.extname(filename).toLowerCase().slice(1) || 'unknown';
}

// Get file type category
function getFileType(filename) {
  const ext = getFileExtension(filename);
  const types = {
    'sql': 'Database',
    'accdb': 'Database',
    'db': 'Database',
    'txt': 'Document',
    'pdf': 'Document',
    'doc': 'Document',
    'docx': 'Document',
    'jpg': 'Image',
    'jpeg': 'Image',
    'png': 'Image',
    'gif': 'Image',
    'js': 'Code',
    'html': 'Code',
    'css': 'Code',
    'json': 'Code',
    'zip': 'Archive',
    'rar': 'Archive',
    '7z': 'Archive'
  };
  return types[ext] || 'Other';
}

// Read files from a directory
function readFilesFromDirectory(folderPath, folderName) {
  try {
    if (!fs.existsSync(folderPath)) {
      return [];
    }
    
    const files = fs.readdirSync(folderPath);
    return files
      .filter(file => {
        const filePath = path.join(folderPath, file);
        return fs.statSync(filePath).isFile();
      })
      .map(file => {
        const filePath = path.join(folderPath, file);
        const stats = fs.statSync(filePath);
        return {
          name: file,
          folder: folderName,
          type: getFileType(file),
          extension: getFileExtension(file),
          size: stats.size,
          modified: stats.mtime,
          path: `assets/${folderName}/${file}`
        };
      });
  } catch (error) {
    console.error(`Error reading directory ${folderPath}:`, error);
    return [];
  }
}

// API: Get all files
app.get('/api/files', (req, res) => {
  try {
    const allFiles = [];
    
    Object.keys(FOLDERS).forEach(folderName => {
      const files = readFilesFromDirectory(FOLDERS[folderName], folderName);
      allFiles.push(...files);
    });
    
    res.json({ success: true, files: allFiles });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// API: Search files
app.get('/api/search', (req, res) => {
  try {
    const query = req.query.q?.toLowerCase() || '';
    const typeFilter = req.query.type || '';
    
    const allFiles = [];
    Object.keys(FOLDERS).forEach(folderName => {
      const files = readFilesFromDirectory(FOLDERS[folderName], folderName);
      allFiles.push(...files);
    });
    
    let filteredFiles = allFiles;
    
    // Filter by search query
    if (query) {
      filteredFiles = filteredFiles.filter(file => 
        file.name.toLowerCase().includes(query)
      );
    }
    
    // Filter by type
    if (typeFilter) {
      filteredFiles = filteredFiles.filter(file => file.type === typeFilter);
    }
    
    res.json({ success: true, files: filteredFiles });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// API: Download file
app.get('/api/download/:folder/:filename', (req, res) => {
  try {
    const { folder, filename } = req.params;
    const folderPath = FOLDERS[folder];
    
    if (!folderPath) {
      return res.status(404).json({ success: false, error: 'Folder not found' });
    }
    
    const filePath = path.join(folderPath, filename);
    
    if (!fs.existsSync(filePath)) {
      return res.status(404).json({ success: false, error: 'File not found' });
    }
    
    res.download(filePath);
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// API: Get file types summary
app.get('/api/types', (req, res) => {
  try {
    const allFiles = [];
    Object.keys(FOLDERS).forEach(folderName => {
      const files = readFilesFromDirectory(FOLDERS[folderName], folderName);
      allFiles.push(...files);
    });
    
    const typeCounts = {};
    allFiles.forEach(file => {
      typeCounts[file.type] = (typeCounts[file.type] || 0) + 1;
    });
    
    res.json({ success: true, types: typeCounts });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// Only start server if not in serverless environment
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
}

// Export for serverless (Vercel)
module.exports = app;
