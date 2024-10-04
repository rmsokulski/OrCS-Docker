# Instalação
O primeiro passo é instalar o Docker. A ideia dele é ser como uma máquina virtual mas sem toda a virtualização convencional. Como resultado, ele permite criar ambientes controlados, iguais em qualquer máquina. (dá até pra rodar o OrCS no Windows com ele :p)

Para instalar no linux, acredito que esse tutorial funcione: [https://docs.sevenbridges.com/docs/install-docker-on-linux](https://docs.sevenbridges.com/docs/install-docker-on-linux).

Ou esse [https://docs.docker.com/engine/install/ubuntu](https://docs.docker.com/engine/install/ubuntu) que eu usei.

Com o docker instalado você precisa montar a máquina virtual que vai permitir rodar o OrCS. Para isso, siga para a seção [Montagem](#montagem).

## Se quiser customizar seu gerador de traços
Substitua a pasta OrCS pelo seu OrCS antes de realizar a montagem. (agora, se está lendo em ordem)


# Montagem
Neste passo, você vai construir uma imagem de acordo com o Dockerfile. Ou seja, o docker vai ler o arquivo Dockerfile e criar uma máquina virtual com o que está descrito nele.

O que ele vai fazer: 
 * Criar uma máquina virtual com Ubuntu.
 * Copiar as pastas OrCS e RequiredFiles para dentro dela
 * Copiar o pinplay para dentro do OrCS
 * Executar o install_tracer.sh
 * Fazer o make clean && make

Para isso, basta executar o seguinte comando (demora):
>> docker build -t orcs .

Caso você mude o arquivo OrCS e execute o comando novamente, fique atento para se ele realmente copia a nova pasta e executa o install_tracer.sh ou só assume que nada mudou (os comandos do install_tracer.sh aparecem?).

# Execução
Após montar a imagem, você precisa executar ela.
A maneira mais simples de executar é com:
>> docker run -it orcs

Com isso, vai aparecer um terminal e você vai estar dentro da máquina virtual. O OrCS capaz de gerar traços vai estar em /OrCS.

*Problema:* Tudo que você fizer nessa máquina estará contido nela. Nenhuma arquivo entra, nenhum arquivo sai. Quando você entrar novamente todas as suas alterações anteriores terão sumido!!

*Solução:* Você pode compartilhar uma pasta entre seu computador e o Docker. Para isso usamos o argumento -v [Pasta na sua máquina>] [Pasta dentro do Docker]. Tudo que for alterado nessa pasta, seja pela máquina virtual, seja pelo seu computador, vai ser compartilhado.
 * Útil para enviar arquivos executáveis para gerar os traços
 * Útil para obter os traços após a geração
Exemplo de uso:
>> docker run -it -v ./Executable:/Executable orcs

Isso inicia a máquina virtual com a pasta /Executable sendo compartilhada.
Você pode compartilhar diversas pastas. Mas por simplicidade vou colocar apenas esse exemplo.