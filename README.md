
# Projeto de Máquina Virtual com Vagrant, Debian 12 e Python 3.12.4

Este projeto configura uma máquina virtual com Vagrant em ambientes Windows 10, usando Debian 12 e Python 3.12.4. A configuração inclui a instalação de diversas ferramentas e bibliotecas necessárias para um ambiente de desenvolvimento completo.

Este guia assume que você já está familiarizado com o Vagrant. Para mais informações e referências sobre o Vagrant, visite o [site oficial do Vagrant](https://www.vagrantup.com).

## Arquivos

### `.gitignore`
Este arquivo é usado para especificar quais arquivos ou diretórios devem ser ignorados pelo Git. Isso evita que arquivos indesejados sejam commitados no repositório.

### `setup.sh`
Este script é responsável por configurar o ambiente de desenvolvimento dentro da máquina virtual. Ele executa as seguintes tarefas:

1. Atualiza a lista de pacotes e o sistema.
2. Instala pacotes básicos de desenvolvimento.
3. Instala pacotes de rede.
4. Instala Docker e Docker Compose.
5. Instala dependências necessárias para a compilação do Python 3.12.4.
6. Compila e instala o Python 3.12.4. ( Demora !!! )
7. Instala o `pip` para Python 3.12.4.
9. Instala o `httpie`.
10. Instala a CLI do GitHub (`gh`) para criar repositórios.
11. Instala o `ignr`, uma ferramenta para criar arquivos `.gitignore`.
 

### Ferramentas que serão instaladas manualmente

1. Instalar o `pipx` e o `poetry`.
2. Configurar o `pyenv` para gerenciar múltiplas versões do Python. Instalar no `pyenv` o python 3.11.9 e 3.12.4.


### `Vagrantfile`
Este arquivo define a configuração da máquina virtual. Ele especifica:

- A box do Debian 12.
- A quantidade de memória e CPUs alocadas.
- O script `setup.sh` que será executado após a inicialização da VM para configurar o ambiente de desenvolvimento.

## Instruções de Uso

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/nilo-lima/debian12-python3-12
   cd debian12-python3-12
   ```

2. **Inicie a máquina virtual:**

   ```bash
   vagrant up
   ```

3. **Acesse a máquina virtual:**

   ```bash
   vagrant ssh
   ```

4. **Verifique a instalação do Python e do Pip:**

   ```bash
   python3 --version
   python3 -m pip --version
   ```

5. **Execute as instruções abaixo para instalar o `pipx`, o `poetry` e o `pyenv`:**


## Instalar o Pipx

   ```bash
   cd /home/vagrant
   /usr/local/bin/python3.12 -m pip install --user pipx && export PATH="$HOME/.local/bin:$PATH" && source ~/.bashrc
   ```

## Instalar o Poetry

```bash
pipx install poetry && poetry --version
```

## Instalar o Penv e python 3.12:latest local e python 3.11:latest local"

```bash
curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc && echo 'eval "$(pyenv init -)"' >> ~/.bashrc && echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc && source ~/.bashrc
pyenv update && pyenv install 3.12:latest && pyenv install 3.11:latest && pyenv --version
```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorias e correções.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).