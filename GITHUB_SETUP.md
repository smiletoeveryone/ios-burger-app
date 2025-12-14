# GitHub Setup Guide - Entropy Burger Shop

Follow these steps to push your Entropy Burger Shop project to GitHub.

## Step 1: Create a GitHub Repository

1. Go to [GitHub.com](https://github.com)
2. Sign in to your account (create one if you don't have it)
3. Click the **+** icon in the top-right corner
4. Select **New repository**
5. Fill in the details:
   - **Repository name**: `entropy-burger-app`
   - **Description**: `A modern iOS app for browsing and ordering burgers with nutritional information - Built with SwiftUI`
   - **Public** (optional, for portfolio purposes)
   - Check **Add a README file** (optional, as we already have one)
   - Check **Add .gitignore** (already have one)
   - Choose license: **MIT License**
6. Click **Create repository**

## Step 2: Push Your Local Repository

After creating the repository, GitHub will show you commands to push your code. Run these in your terminal:

```bash
cd /Users/fiftycentsjj/Downloads/entropy_app/app

# Add the remote repository (replace with your GitHub username and repo name)
git remote add origin https://github.com/YOUR_USERNAME/entropy-burger-app.git

# Rename branch if needed (GitHub uses 'main' by default)
git branch -M main

# Push your code
git push -u origin main
```

## Step 3: Verify on GitHub

1. Go to your GitHub repository URL: `https://github.com/YOUR_USERNAME/entropy-burger-app`
2. Verify that:
   - ✅ All files are uploaded
   - ✅ README.md displays correctly
   - ✅ Project structure is visible
   - ✅ .gitignore and LICENSE files are present

## Step 4: Add Project Tags/Releases (Optional)

Create your first release:

```bash
git tag -a v1.0.0 -m "Initial release - Entropy Burger Shop v1.0.0"
git push origin v1.0.0
```

Then on GitHub:
1. Go to **Releases** section
2. Click **Create a new release**
3. Select the tag `v1.0.0`
4. Add a release title and description
5. Click **Publish release**

## Step 5: Add GitHub Badges to README (Optional)

Add these badges to the top of your README.md for a professional look:

```markdown
[![GitHub license](https://img.shields.io/github/license/YOUR_USERNAME/entropy-burger-app?style=flat-square)](https://github.com/YOUR_USERNAME/entropy-burger-app/blob/main/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/entropy-burger-app?style=flat-square)](https://github.com/YOUR_USERNAME/entropy-burger-app/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/YOUR_USERNAME/entropy-burger-app?style=flat-square)](https://github.com/YOUR_USERNAME/entropy-burger-app/network)
[![Swift 5.9+](https://img.shields.io/badge/Swift-5.9%2B-orange?style=flat-square)](https://developer.apple.com/swift)
[![iOS 26.1+](https://img.shields.io/badge/iOS-26.1%2B-blue?style=flat-square)](https://developer.apple.com/ios)
[![SwiftUI](https://img.shields.io/badge/Framework-SwiftUI-green?style=flat-square)](https://developer.apple.com/swiftui)
```

## Step 6: Enable GitHub Pages (Optional)

To showcase your project with a website:

1. Go to **Settings** → **Pages**
2. Under "Build and deployment"
3. Select **Deploy from a branch**
4. Choose **main** branch and **/root** folder
5. Click **Save**

Your project documentation will be available at: `https://YOUR_USERNAME.github.io/entropy-burger-app`

## Step 7: Set Up GitHub Actions (Optional CI/CD)

Create `.github/workflows/swift.yml`:

```yaml
name: Build and Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: macos-latest
    steps:
    - uses: actions/checkout@v3
    - name: Build
      run: |
        xcodebuild -scheme app -destination 'platform=iOS Simulator,name=iPhone 17 Pro' build
```

## Project URLs

After setup, your project will be available at:
- **Repository**: `https://github.com/YOUR_USERNAME/entropy-burger-app`
- **Clone URL**: `git@github.com:YOUR_USERNAME/entropy-burger-app.git`
- **Raw README**: `https://raw.githubusercontent.com/YOUR_USERNAME/entropy-burger-app/main/README.md`

## Useful GitHub Commands

### Clone the repository locally
```bash
git clone https://github.com/YOUR_USERNAME/entropy-burger-app.git
```

### View remote configuration
```bash
git remote -v
```

### Update local repository
```bash
git pull origin main
```

### Create a new branch for features
```bash
git checkout -b feature/your-feature-name
git push -u origin feature/your-feature-name
```

### Create a Pull Request
1. Push your feature branch to GitHub
2. Go to your repository
3. Click "Compare & pull request"
4. Add description and click "Create pull request"

## Troubleshooting

### Remote already exists
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/entropy-burger-app.git
```

### Authentication issues
1. Generate a Personal Access Token (PAT):
   - GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Select scopes: `repo`, `workflow`, `write:packages`
   - Copy the token
2. Use token instead of password when prompted

### Large files
If you have large files, consider:
1. Adding them to .gitignore
2. Using Git LFS (Large File Storage)

## Project Statistics

Your GitHub repository will automatically show:
- ✅ Language breakdown (Swift)
- ✅ Commit history
- ✅ Contributors
- ✅ Traffic analytics
- ✅ Network graph

## Next Steps

1. ✅ Share your repository link
2. Add topics: `ios`, `swiftui`, `food-delivery`, `burger`, `shopping-app`
3. Write detailed commit messages
4. Encourage contributions with clear guidelines
5. Keep documentation updated
6. Monitor issues and pull requests

## Share Your Project

Share your GitHub repository:
- **Twitter/X**: "Check out my iOS Burger Shop app built with SwiftUI! #iOS #SwiftUI"
- **LinkedIn**: Add to your projects portfolio
- **Portfolio Website**: Link to your repository
- **Dev.to/Medium**: Write an article about the development process

---

**Happy coding! Your Entropy Burger Shop is now on GitHub! 🍔📱**
