ADVPL-SMS
=========

Uma biblioteca para envio de SMS(mensagens de texto) para o protheus. Confira mais detalhes em 
http://advplhelp.com 
    
## Introdução
Hoje o protheus não apresenta nenhuma solução para envio de SMS nativa, recentemente fiz o desenvolvimento para envio de SMS por modem ou gateway.

##Como fazer a instalação 
Primeiro é necessário aplicar o Patch SMS.ptm, após isso confira o arquivo src/SMSTESTE.PRW que faz as chamadas de envio

**Números de telefone devem ser informados seguindo o seguinte, padrão 2 dígitos para o ddd, e 8 à 9 dígitos para o número de telefone**

##Funcoes para envio
	/*/{Protheus.doc} SMSServic
	Método para envio de sms por provedor SMS (Gateway)
	@author lima
	@since 18/10/2014
	@version 1.0
	@param cphone, character, (Numero do telefone com DDD)
	@param cText, character, (Texto da mensagem)
	@param cUser, character, (Usuário do provedor, para teste utilize advpl@help)
	@param cKey, character, (Senha do usuário, para teste utilize advpl@help )
	@return ${Lógico}, ${return_description}
	@example
	CONFIRA SMSDIALG() NO ARQUIVO SMSTESTE.PRW
	@see HTTP://WWW.ADVPLHELP.COM
	/*/
	
	/*/{Protheus.doc} SMSModem
	Método para envio de sms por modem
	@author Cladimir lima bubans
	@since 05/05/2014
	@version 3.0
	@param cPhone, character, (numero do telefone com DDD)
	@param cText, character, (Texto a ser enviado)
	@param cModem, character, (porta aonde esta conctado o modem)
	@param nType, numérico, (1-modem conectado no client / 2-modem conectado no servidor) *VÁLIDO SOMENTE PARA VERSAO PAGA,USAR 1 PARA TESTE
	@return ${null}, ${sem retorno}
	@example
	CONFIRA SMSDIALG() NO ARQUIVO SMSTESTE.PRW
	@see HTTP://WWW.ADVPLHELP.COM
	/*/
##Mais infromacoes
Confiram em **http://advplhelp.com/sms/**