#!/bin/bash

# This script is used to rename the project .NET.

### Atention:
### Do a backup of the project before running the script.

# The projects needs to be in the src folder
# ./src/OldName.Api

# Uso: ./rename_proj.sh OldName NewName

OLD_NAME=$1
NEW_NAME=$2

if [ -z "$OLD_NAME" ] || [ -z "$NEW_NAME" ]; then
  echo "Uso: $0 NomeAntigo NomeNovo"
  exit 1
fi

echo "🔄 Renomeando $OLD_NAME para $NEW_NAME ..."

# 1. Alterar namespaces e usings dentro dos arquivos .cs, .csproj, .sln
echo "👉 Alterando namespaces nos arquivos..."
find ./src -type f \( -name "*.cs" -o -name "*.csproj" -o -name "*.sln" \) -print0 \
  | xargs -0 sed -i "s/\b$OLD_NAME\b/$NEW_NAME/g"

# 2. Renomear diretórios
echo "👉 Renomeando diretórios..."
find ./src -depth -type d -name "*$OLD_NAME*" | while read dir; do
  newdir=$(echo "$dir" | sed "s/$OLD_NAME/$NEW_NAME/g")
  mv "$dir" "$newdir"
done

# 3. Renomear arquivos
echo "👉 Renomeando arquivos..."
find ./src -type f -name "*$OLD_NAME*" | while read file; do
  newfile=$(echo "$file" | sed "s/$OLD_NAME/$NEW_NAME/g")
  mv "$file" "$newfile"
done

# 4. Renomear arquivos .sln
echo "👉 Renomeando arquivos .sln..."
find . -type f -name "*$OLD_NAME*.sln" | while read file; do
  newfile=$(echo "$file" | sed "s/$OLD_NAME/$NEW_NAME/g")
  mv "$file" "$newfile"
done

# 5. Ajusta path dentro do arquivo .sln
echo "👉 Ajustando path dentro do arquivo .sln..."
find . -type f -name "*$NEW_NAME*.sln" | while read file; do
  sed -i "s/$OLD_NAME/$NEW_NAME/g" "$file"
done

echo "✅ Renomeação concluída!"
