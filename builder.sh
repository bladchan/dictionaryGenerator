cd ~
if [ -d "codeql-home" ]; then
    echo "Exist !"
    exit 1
fi
mkdir codeql-home
cd codeql-home

wget https://codeload.github.com/github/codeql/zip/refs/tags/codeql-cli/v2.7.3
unzip "v2.7.3"
mv codeql-codeql-cli-v2.7.3 codeql-repo

git clone https://github.com/github/codeql-go.git

wget https://github.com/github/codeql-cli-binaries/releases/download/v2.7.3/codeql-linux64.zip
unzip codeql-linux64.zip 
mv codeql codeql-cli
export "PATH=~/codeql-home/codeql-cli/:$PATH"
echo "export PATH=~/codeql-home/codeql-cli/:$PATH" >> ~/.bashrc
codeql resolve languages
codeql resolve qlpacks
codeql

