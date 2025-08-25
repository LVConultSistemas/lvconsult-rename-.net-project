# 🔄 Rename Project Script

Este script automatiza a renomeação completa de um projeto **.NET** ou **C#** que use múltiplos diretórios, arquivos `.csproj`, `.sln` e namespaces.  
Ele altera:

- **Conteúdo** dentro de arquivos (`namespace NovoNome.*`, `using NovoNome.*`, referências em `.sln`, `.csproj`, etc.)
- **Nomes de diretórios** (`NovoNome.Api` → `NovoNome.Api`)
- **Nomes de arquivos** (`NovoNome.sln` → `NovoNome.sln`, `NovoNome.Application.csproj` → `NovoNome.Application.csproj`, etc.)

---

## 📌 Uso

### 1. Dar permissão de execução
```bash
chmod +x rename_proj.sh
