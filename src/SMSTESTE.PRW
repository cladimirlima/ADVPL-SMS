/*Copyright ©2014 Cladimir lima bubans Todos os direitos reservados.

Nenhuma parte deste código pode ser copiada, reproduzida, traduzida ou transmitida 
por qualquer meio eletrônico ou mecânico, na sua totalidade ou em parte, sem 
a prévia autorização escrita do autor , que reserva-se o direito de efetuar
alterações sem aviso prévio. O autor não assume nenhuma responsabilidade pelas 
conseqüências de quaisquer erros ou inexatidões que possam aparecer neste documento.

http://advplhelp.com
cladimirlima@gmail.com*/
#INCLUDE "PROTHEUS.CH"


/*/{Protheus.doc} SMSDIALG
(long_description)
@author desenvolvimento
@since 15/10/2014
@version 1.0
@return ${return}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/USER FUNCTION SMSDIALG()
	Private cPhone     := Space(11)
	Private cKey     := 'advpl@help'
	Private cUser      := 'advpl@help'
	Private cMessage   := Space(140)
	Private cCOM := Space(5)
	
	Private nType     
	
	SetPrvt("oDlg1","oSay1","oSay2","oSay3","oSay4","oSay5","oSay6","oSay7","oSay8","oSay9","oSay10","oSay11")
	SetPrvt("oGet2","oGet3","oCBox1","oBtn1","oMGet1")
	
	oDlg1      := MSDialog():New( 091,232,524,515,"SMS ADVPLHELP.COM",,,.F.,,,,,,.T.,,,.T. )
	oSay1      := TSay():New( 004,004,{||"usuario para acesso a rotina"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,074,008)
	oSay2      := TSay():New( 025,004,{||"senha para acesso a rotina"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,070,008)
	oSay3      := TSay():New( 066,004,{||"Telefone"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
	oSay4      := TSay():New( 046,004,{||"Tipo de envio                                 Porta Com"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,128,008)
	oSay5      := TSay():New( 091,004,{||"Mensagem"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
	oSay6      := TSay():New( 196,004,{||"Esta rotina é um exemplo de envio, para utilizar no"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,120,008)
	oSay7      := TSay():New( 205,004,{||"seu codigo use as funcoes U_SENDSMS."},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,120,008)
	oSay8      := TSay():New( 214,004,{||""},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,120,008)
	oGet1      := TGet():New( 012,004,{|u| If(PCount()>0,cUser:=u,cUser)},oDlg1,124,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cUser",,)
	oGet2      := TGet():New( 033,004,{|u| If(PCount()>0,cKey:=u,cKey)},oDlg1,124,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cKey",,)
	oCBox1     := TComboBox():New( 052,004,{|u| If(PCount()>0,nType:=u,nType)},{"1-Servidor (via advplhelp.com)","2-Local (via modem)"},072,010,oDlg1,,,,CLR_BLACK,CLR_WHITE,.T.,,"",,,,,,,nType )
	oGet4      := TGet():New( 052,084,{|u| If(PCount()>0,cCOM :=u,cCOM )},oDlg1,044,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCOM",,)
	oGet3      := TGet():New( 074,004,{|u| If(PCount()>0,cPhone:=u,cPhone)},oDlg1,124,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cPhone",,)
	oMGet1     := TMultiGet():New( 100,004,{|u| If(PCount()>0,cMessage:=u,cMessage)},oDlg1,124,068,,,CLR_BLACK,CLR_WHITE,,.T.,"",,,.F.,.F.,.F.,,,.F.,,  )
	oBtn1      := TButton():New( 176,004,"ENVIAR",oDlg1,{||SEND( AllTrim(cUser), AllTrim(cKey), val(substr(nType,1,1)), AllTrim(cMessage),AllTrim(cPhone),AllTrim(cCOM)),MSGALERT(("PROCESSO CONCLUIDO."),"aviso")},124,012,,,,.T.,,"",,,,.F. )
	
	oDlg1:Activate(,,,.T.)
RETURN


/*/{Protheus.doc} SEND
(long_description)
@author desenvolvimento
@since 15/10/2014
@version 1.0
@param _cUser, ${Caracter}, (nome do usuario para envio pela Web)
@param _cKey, ${Caracter}, (senha do usuario para envio pela Web)
@param _nType, ${param_type}, (tipo de envio)
@param _cMessage, ${Caracter}, (mensagem de texto)
@param _cPhone, ${Caracter}, (telefone com o DDD)
@param _cCOM, ${Caracter}, (porta com onde esta conectado o modem 3G)
@return ${null}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/STATIC FUNCTION SEND(_cUser, _cKey,_nType, _cMessage,_cPhone,_cCOM)
	IF _nType == 1
		U_SMSServic(_cPhone,_cMessage,_cUser, _cKey)
	ELSE
		U_SMSModem(_cPhone ,_cMessage,_cCOM)
	ENDIF
RETURN