Program ConsultorioOdontologico ;                                   
type

{--------------------------PACIENTE----------------}
	TPaciente = record
		nome: string;
		data_nascimento: string;
		cpf: string;
		telefone: string;
		endereco: string;
		email: string;
		observacao: string;
	end;

	TListaPacientes = array[1..5] of TPaciente;
{--------------------------PACIENTE----------------}

{--------------------------FUNCION�RIO----------------}
	TFuncionario = record
		nome: string;
		data_nascimento: string;
		cpf: string;
		telefone: string;
		endereco: string;
		email: string;
		cargo: string;
		cro: string;
		salario: real;
	end;

	TListaFuncionarios = array[1..5] of TFuncionario;
{--------------------------FUNCION�RIO----------------}

{--------------------------ESTOQUE----------------}
	TProduto= record
		cod: integer;
		descricao: string;
		unidades: integer;
		marca: string;
		tamanho_embalagem: string;
		validade: string;
		preco_unitario: real;
		preco_total:real;
end;

	TListaEstoque = array[1..5] of TProduto;
{--------------------------ESTOQUE----------------}

{--------------------------PROCEDIMENTO----------------}
  TProcedimento = record
		cod: integer;
		descricao: string;
		preco: real;
	end;

	TListaProcedimento = array[1..5] of TProcedimento;
{--------------------------PROCEDIMENTO----------------}			
				
{--------------------------AGENDAMENTO----------------}		
	TAgendamento = record
		cod: integer;
		cod_procedimento: integer;
		cpf_paciente: string;
		cro_dentista: string;
		dataHora: string;
		qtd_procedimento: integer;
		total_pagamento: real;
	end;

	TListaAgendamentos = array[1..5] of TAgendamento;		
{--------------------------AGENDAMENTO----------------}		
		
		
var
	opcao:integer;
	
{--------------------------PACIENTE----------------}
	listaPacientes: TListaPacientes;
{--------------------------PACIENTE----------------}


{--------------------------FUNCION�RIO----------------}
  listaFuncionario: TListaFuncionarios;
{--------------------------FUNCION�RIO----------------}


{--------------------------ESTOQUE----------------}
  listaEstoque: TListaEstoque;
  cod_gerado_estoque: integer;
{--------------------------ESTOQUE----------------}

 
{--------------------------PROCEDIMENTO----------------} 
	listaProcedimentos: TListaProcedimento;
	cod_gerado_procedimento: integer;
{--------------------------PROCEDIMENTO----------------}
 
  
{--------------------------AGENDAMENTO----------------}
	listaAgendamentos: TListaAgendamentos;
	cod_gerado_agendamento: integer; 
{--------------------------AGENDAMENTO----------------}	
 
   
{------------------------------------------------------------------------------------------------------------------------------PACIENTE------------------------------------------------------------------------------------------------------------------------------------------------------------------------}
{Fun��o respons�vel por identificar um lugar da array que est� dispon�vel para ser preenchido com um novo paciente}
Function PegaIndexPacienteVazio():integer;
var
indexPaciente, i: integer;
Begin
	indexPaciente := -1;
	
	for i := 1 to 5 do
 	begin
 		if (listaPacientes[i].cpf = '') then
        indexPaciente := i;	
 	end;
 	
 	 PegaIndexPacienteVazio := indexPaciente;
End; 

{Procedure respons�vel por cadastrar pacientes}
Procedure CadastrarPaciente;
var
index: integer;
Begin

	index:= PegaIndexPacienteVazio;
	
	
	if (index <> -1 ) then begin
		  
		  writeln('Informe o nome do paciente:');
		  readln(listaPacientes[index].nome);
		  
		  writeln('Informe a data de nacimento do paciente:');
		  readln(listaPacientes[index].data_nascimento);
		  
		  writeln('Informe o CPF do paciente:');
		  readln(listaPacientes[index].cpf);
		  
		  writeln('Informe o telefone do paciente:');
		  readln(listaPacientes[index].telefone);
		  
		  writeln('Informe o endere�o do paciente:');
		  readln(listaPacientes[index].endereco);
		  
		  writeln('Informe o email do paciente:');
		  readln(listaPacientes[index].email);
		  
		  writeln('Informe alguma observa��o do paciente:');
		  readln(listaPacientes[index].observacao);
		  		  
      Writeln();
      Writeln('Paciente cadastrado com sucesso!');
      Writeln();
  end
  else
  begin
  	Writeln();
  	writeln('N�o � poss�vel criar um novo paciente! Limite de cadastro atingido.');
  	Writeln();
  end;
End;

{Fun��o respons�vel por pegar um paciente atrav�s do seu CPF}
Function PegaIndexPacientePeloCpf(var cpf: string):integer;
var
i, indexPaciente:integer;

Begin
	indexPaciente := -1;
	
	for i := 1 to 5 do
 	begin
   if (listaPacientes[i].cpf = cpf) then
     	 indexPaciente := i;
	end;

	 PegaIndexPacientePeloCpf := indexPaciente;	 
End;

{Layout default para apresenta��o de paciente}
Procedure ApresentaLayoutPaciente(var index:integer);
Begin
	writeln();
	writeln('----------------------------------------------------------------------------');
	writeln('			NOME DO PACIENTE: ', listaPacientes[index].nome);
	writeln('Data de nascimento: ', listaPacientes[index].data_nascimento);
	writeln('CPF: ', listaPacientes[index].cpf);
	writeln('Telefone: ', listaPacientes[index].telefone);
	writeln('Endere�o: ', listaPacientes[index].endereco);
	writeln('Email: ', listaPacientes[index].email);
	writeln('Observa��o: ', listaPacientes[index].observacao);
	writeln('----------------------------------------------------------------------------');
	writeln();
End;

{Procedure respons�vel por atualizar pacientes}
Procedure AtualizarPaciente;
var
	indexPaciente: integer;
	atualizar: char;
	cpf,data, hora: string;
Begin
  writeln();
	writeln('Informe o CPF do paciente que desejas atualizar:');
	readln(cpf);
	
	indexpaciente := PegaIndexPacientePeloCpf(cpf);
	
	if (indexPaciente <> -1) then begin
			
			writeln();
			writeln('Paciente encontrado:');
			ApresentaLayoutPaciente(indexPaciente);
   		
   		writeln('Deseja atualizar o nome do paciente? (S|N)' );
   		readln(atualizar);
   		writeln();
   		if (upcase(atualizar) = 'S') then begin
       	writeln('Informe um novo nome para o paciente:');
		  	readln(listaPacientes[indexPaciente].nome);
		  	writeln();
     end;
   		
		  writeln('Deseja atualizar a data de nascimento do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova data de nascimento para o paciente:');
			  readln(listaPacientes[indexPaciente].data_nascimento);
			  writeln();
			 end;
		  
		  writeln('Deseja atualizar o CPF do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo CPF para o paciente:');
			  readln(listaPacientes[indexPaciente].cpf);
			  writeln();
		  end;
		  
		  writeln('Deseja atualizar o telefone do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo telefone para o paciente:');
			  readln(listaPacientes[indexPaciente].telefone);
			  writeln();
			end;
		  
		  writeln('Deseja atualizar o endere�o do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo endere�o para o paciente:');
			  readln(listaPacientes[indexPaciente].endereco);
			  writeln();
			end;
			
			writeln('Deseja atualizar o email do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo email para o paciente:');
			  readln(listaPacientes[indexPaciente].email);
			  writeln();
			end;
			
			writeln('Deseja atualizar a observa��o do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova observa��o para o paciente:');
			  readln(listaPacientes[indexPaciente].observacao);
			  writeln();
			end;
		  
      Writeln();
      Writeln('Paciente atualizado com sucesso!');
   		ApresentaLayoutPaciente(indexPaciente);   		
 	end
 	
 	else
 	begin
 		writeln('CPF do paciente n�o encontrado!');
 		AtualizarPaciente();
 	end;
End;
  
{Procedure respons�vel por excluir pacientes}
Procedure ExcluirPaciente;
var
	cpf: string; 
	indexPaciente: integer;
	excluir: char;
Begin
  writeln();
	writeln('Informe o CPF do paciente que desejas excluir:');
	readln(cpf);
	
	indexPaciente := PegaIndexPacientePeloCpf(cpf);
	
	if (indexPaciente <> -1) then begin
			
			writeln();
			writeln('Tem certeza que deseja excluir este paciente? (S | N)');
			
			ApresentaLayoutPaciente(indexPaciente);
			
			readln(excluir);
			
			if (upcase(excluir) = 'S') then begin
	     	listaPacientes[indexPaciente].nome := '';
				listaPacientes[indexPaciente].data_nascimento := '';
				listaPacientes[indexPaciente].cpf := '';
				listaPacientes[indexPaciente].telefone := '';
				listaPacientes[indexPaciente].endereco := '';
				listaPacientes[indexPaciente].email := '';
				listaPacientes[indexPaciente].observacao := '';
				
				writeln();
				writeln('Paciente exclu�do com sucesso!');
   		end
   		else
				writeln('Exclus�o cancelada!');
 	end
 	else
 	begin
 		writeln('CPF do paciente n�o encontrado!');
 		ExcluirPaciente();
 	end;
End;

{Procedure respons�vel por apresentar paciente}
Procedure VisualizarPacientes();
var 
QtdPacientesApresentados, i: integer;
Begin
	for i := 1 to 5 do
	begin
		if (listaPacientes[i].cpf <> '') then begin
				inc(QtdPacientesApresentados);
				ApresentaLayoutPaciente(i);
		end;
	end;
	
	if (QtdPacientesApresentados = 0) then
  begin
  	writeln();
  	writeln('Nenhum paciente cadastrado!');
  	writeln();
  end;

End;

{Menu principal de pacientes}
Procedure MenuPacientes;
var
op: integer;
Begin
	repeat
		writeln();
		writeln('					MENU DE PACIENTES');
		writeln();
		writeln('[1] - Para cadastrar um novo paciente');
		writeln('[2] - Para atualizar um paciente existente');
		writeln('[3] - Para excluir paciente');
		writeln('[4] - Para visualizar todos os paciente cadastrados');
		writeln('[0] - Para voltar');
		writeln();
		readln(op);
	
	  case (op) of 
	    1: CadastrarPaciente();
	    2: AtualizarPaciente();
	    3: ExcluirPaciente();
	    4: VisualizarPacientes();
	  end;
	until (op = 0);
End;

{------------------------------------------------------------------------------------------------------------------------------PACIENTE------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------FUNCIONARIO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

 {Fun��o respons�vel por identificar um lugar da array que est� dispon�vel para ser preenchido com um novo funcionario}
Function PegaIndexFuncionarioVazio():integer;
var
indexFuncionario, i: integer;
Begin
	indexFuncionario := -1;
	                                    
	for i := 1 to 5 do
 	begin
 		if (listaFuncionario[i].cpf = '') then
        indexFuncionario := i;	
 	end;
 	
 	 PegaIndexFuncionarioVazio := indexFuncionario;
End; 

{Procedure respons�vel por cadastrar funcionario}
Procedure CadastrarFuncionario;
var
index, cargo: integer;
Begin

	index:= PegaIndexFuncionarioVazio;
	
	
	if (index <> -1 ) then begin

		  
		  writeln('Informe o nome do funcion�rio:');
		  readln(listaFuncionario[index].nome);
		  
		  writeln('Informe a data de nacimento do funcion�rio:');
		  readln(listaFuncionario[index].data_nascimento);
		  
		  writeln('Informe o CPF do funcion�rio:');
		  readln(listaFuncionario[index].cpf);
		  
		  writeln('Informe o telefone do funcion�rio:');
		  readln(listaFuncionario[index].telefone);
		  
		  writeln('Informe o endere�o do funcion�rio:');
		  readln(listaFuncionario[index].endereco);
		  
		  writeln('Informe o email do funcion�rio:');
		  readln(listaFuncionario[index].email);
		  
		  writeln('Informe o cargo do funcion�rio:');
		  writeln('[1] - Secret�ria');
		  writeln('[2] - Dentista');
		  writeln('[3] - Gerente');
		  
		  readln(cargo);
		  case (cargo) of 
      1: listaFuncionario[index].cargo := 'Secret�ria';
      2: listaFuncionario[index].cargo := 'Dentista';
      3: listaFuncionario[index].cargo := 'Gerente';  
     end;
		  
		  if (cargo = 2) then begin
		      writeln('Informe o CRO do dentista:');
		  		readln(listaFuncionario[index].cro);
		  end;
		  
		  writeln('Informe o sal�rio do funcion�rio:');
		  readln(listaFuncionario[index].salario);
		  
      Writeln();
      Writeln('Funcionario cadastrado com sucesso!');
      Writeln();
  end
  else
  begin
  	Writeln();
  	writeln('N�o � poss�vel criar um novo funcionario! Limite de cadastro atingido.');
  	Writeln();
  end;
End;

{Fun��o respons�vel por pegar um funcion�rio atrav�s do seu CPF}
Function PegaIndexFuncionarioPeloCpf(var cpf: string):integer;
var
i, indexFunci:integer;

Begin
	indexFunci := -1;
	
	for i := 1 to 5 do
 	begin
   if (listaFuncionario[i].cpf = cpf) then
     	 indexFunci := i;
	end;

	 PegaIndexFuncionarioPeloCpf := indexFunci;
	 
End;

{Layout default para apresenta��o de funcionario}
Procedure ApresentaLayoutFuncionario(var index:integer);
Begin
	writeln();
	writeln('----------------------------------------------------------------------------');
	writeln('			NOME DO FUNCION�RIO: ', listaFuncionario[index].nome);
	writeln('Data de nascimento: ', listaFuncionario[index].data_nascimento);
	writeln('CPF: ', listaFuncionario[index].cpf);
	writeln('Telefone: ', listaFuncionario[index].telefone);
	writeln('Endere�o: ', listaFuncionario[index].endereco);
	writeln('Email: ', listaFuncionario[index].email);
	writeln('Cargo : ', listaFuncionario[index].cargo);
	writeln('sal�rio : ', listaFuncionario[index].salario:2:2);
	
	if (listaFuncionario[index].cargo = 'Dentista') then begin
   		writeln('CRO : ', listaFuncionario[index].cro);
 	end;
	
	writeln('----------------------------------------------------------------------------');
	writeln();
End;

{Procedure respons�vel por atualizar funcion�rios}
Procedure AtualizarFuncionario;
var
	indexFuncionario, cargo: integer;
	atualizar: char;
	cpf, cargoAntigo: string;
Begin
  writeln();
	writeln('Informe o CPF do funcion�rio que desejas atualizar:');
	readln(cpf);
	
	indexFuncionario := PegaIndexFuncionarioPeloCpf(cpf);
	
	if (indexFuncionario <> -1) then begin
			
			writeln();
			writeln('funcion�rio encontrado:');
			ApresentaLayoutFuncionario(indexFuncionario);
   		
   		writeln('Deseja atualizar o nome do funcion�rio? (S | N)' );
   		readln(atualizar);
   		writeln();
   		if (upcase(atualizar) = 'S') then begin
       	writeln('Informe um novo nome para o funcion�rio:');
		  	readln(listaFuncionario[indexFuncionario].nome);
		  	writeln();
     	end;
   		
		  writeln('Deseja atualizar a data de nascimento do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova data de nascimento para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].data_nascimento);
			  writeln();
			 end;
		  
		  writeln('Deseja atualizar o CPF do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo CPF para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].cpf);
			  writeln();
		  end;
		  
		  writeln('Deseja atualizar o telefone do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo telefone para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].telefone);
			  writeln();
			end;
		  
		  writeln('Deseja atualizar o endere�o do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo endere�o para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].endereco);
			  writeln();
			end;
			
			writeln('Deseja atualizar o email do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo email para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].email);
			  writeln();
			end;
			
			writeln('Deseja atualizar o cargo do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
   			cargoAntigo := listaFuncionario[indexFuncionario].cargo;
			  writeln('Informe um novo cargo para o funcion�rio:');
			  writeln('[1] - Secret�ria');
		  	writeln('[2] - Dentista');
		  	writeln('[3] - Gerente');
			  readln(cargo);
			  
			  case (cargo) of 
		      1: listaFuncionario[indexFuncionario].cargo := 'Secret�ria';
		      2: listaFuncionario[indexFuncionario].cargo := 'Dentista';
		      3: listaFuncionario[indexFuncionario].cargo := 'Gerente';  
	     	end;
			  writeln();
			end;
			
			if (cargoAntigo = 'Dentista' ) and (listaFuncionario[indexFuncionario].cargo <> 'Dentista') then
					listaFuncionario[indexFuncionario].cro := '';
     			
			
			
			
			if (listaFuncionario[indexFuncionario].cargo = 'Dentista' ) then begin
	     		writeln('Deseja atualizar ou adicionar o CRO do dentista? (S | N)');
				  readln(atualizar);
				  writeln();
		   		if (upcase(atualizar) = 'S' ) then begin
					  writeln('Informe um novo CRO para o funcion�rio:');
					  readln(listaFuncionario[indexFuncionario].cro);
					  writeln();
					end;
   			end
   			
   		else if (listaFuncionario[indexFuncionario].cargo <> 'Dentista') and (cargoAntigo = 'Dentista' ) then
					listaFuncionario[indexFuncionario].cro := '';
				
			
			writeln('Deseja atualizar o sal�rio do funcion�rio? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo sal�rio para o funcion�rio:');
			  readln(listaFuncionario[indexFuncionario].cargo);
			  writeln();
			end;
			
			
		  
      Writeln();
      Writeln('Funcion�rio atualizado com sucesso!');
   		ApresentaLayoutFuncionario(indexFuncionario);   		
 	end
 	
 	else
 	begin
 		writeln('CPF do funcion�rio n�o encontrado!');
 		AtualizarFuncionario();
 	end;
End;
  
{Procedure respons�vel por excluir funcion�rios}
Procedure ExcluirFuncionario;
var
	cpf: string; 
	indexFuncionario: integer;
	excluir: char;
Begin
  writeln();
	writeln('Informe o CPF do funcion�rio que desejas excluir:');
	readln(cpf);
	
	indexFuncionario := PegaIndexFuncionarioPeloCpf(cpf);
	
	if (indexFuncionario <> -1) then begin
			
			writeln();
			writeln('Tem certeza que deseja excluir este funcion�rio? (S | N)');
			
			ApresentaLayoutFuncionario(indexFuncionario);
			
			readln(excluir);
			
			if (upcase(excluir) = 'S') then begin
	     	listaFuncionario[indexFuncionario].nome := '';
				listaFuncionario[indexFuncionario].data_nascimento := '';
				listaFuncionario[indexFuncionario].cpf := '';
				listaFuncionario[indexFuncionario].telefone := '';
				listaFuncionario[indexFuncionario].endereco := '';
				listaFuncionario[indexFuncionario].email := '';
				listaFuncionario[indexFuncionario].cargo := '';
				listaFuncionario[indexFuncionario].cro := '';
				listaFuncionario[indexFuncionario].salario := 0;
				
				writeln();
				writeln('Funcion�rio exclu�do com sucesso!');
   		end
   		else
				writeln('Exclus�o cancelada!');
 	end
 	else
 	begin
 		writeln('CPF do funcion�rio n�o encontrado!');
 		ExcluirFuncionario();
 	end;
End;

{Procedure respons�vel por apresentar funcion�rios}
Procedure VisualizarFuncionarios();
var 
QtdFuncionariosApresentados, i: integer;
Begin
	for i := 1 to 5 do
	begin
		if (listaFuncionario[i].cpf <> '') then begin
				inc(QtdFuncionariosApresentados);
				ApresentaLayoutFuncionario(i);
		end;
	end;
	
	if (QtdFuncionariosApresentados = 0) then
  begin
  	writeln();
  	writeln('Nenhum funcion�rio cadastrado!');
  	writeln();
  end;

End;

{Menu principal de funcion�rio}
Procedure MenuFuncionarios;
var
op: integer;
Begin
	repeat
		writeln();
		writeln('					MENU DE FUNCION�RIOS');
		writeln();
		writeln('Para cadastrar um novo funcion�rio digite 1');
		writeln('Para atualizar um funcion�rio existente digite 2');
		writeln('Para excluir funcion�rio digite 3');
		writeln('Para visualizar todos os funcion�rio cadastrados digite 4');
		writeln('Para voltar digite 0');
		writeln();
		readln(op);
	
	  case (op) of 
	    1: CadastrarFuncionario();
	    2: AtualizarFuncionario();
	    3: ExcluirFuncionario();
	    4: VisualizarFuncionarios();
	  end;
	until (op = 0);
End;
{------------------------------------------------------------------------------------------------------------------------------FUNCIONARIO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------ESTOQUE------------------------------------------------------------------------------------------------------------------------------------------------------------------------}
{Fun��o respons�vel por identificar um lugar da array que est� dispon�vel para ser preenchido com um novo produto}
Function PegaIndexEstoqueVazio():integer;
var
indexEstoque, i: integer;
Begin
	indexEstoque := -1;
	
	for i := 1 to 5 do
 	begin
 		if (listaEstoque[i].cod = 0) then
        indexEstoque := i;	
 	end;
 	
 	 PegaIndexEstoqueVazio := indexEstoque;
End; 

{Procedure respons�vel por cadastrar estoque}
Procedure CadastrarEstoque;
var
index, tamanhoEmbalagem: integer;
Begin
	inc(cod_gerado_estoque);
	index:= PegaIndexEstoqueVazio;
	
	
	if (index <> -1 ) then begin
		  listaEstoque[index].cod := cod_gerado_estoque;
		  
		  writeln('Informe a descri��o do produto:');
		  readln(listaEstoque[index].descricao);
		  
		  writeln('Informe a quantidade de unidades desse produto:');
		  readln(listaEstoque[index].unidades);
		  
		  writeln('Informe a marca do produto:');
		  readln(listaEstoque[index].marca);
		  
		  writeln('Informe o tamanho da embalagem do produto:');
		  writeln('[1] - Grande');
		  writeln('[2] - M�dia');
		  writeln('[3] - Pequena');
		  readln(tamanhoEmbalagem);
		  
		  case (tamanhoEmbalagem ) of 
      1: listaEstoque[index].tamanho_embalagem := 'Grande';
      2: listaEstoque[index].tamanho_embalagem := 'M�dia';
      3: listaEstoque[index].tamanho_embalagem := 'Pequena';
    	end;
		  
		  writeln('Informe a data de validade do produto:');
		  readln(listaEstoque[index].validade);
		                                         
		  writeln('Informe o pre�o do produto:');
		  readln(listaEstoque[index].preco_unitario);
		  
		  listaEstoque[index].preco_total := (listaEstoque[index].preco_unitario * listaEstoque[index].unidades);
		   
      Writeln();
      Writeln('Produto cadastrado no estoque com sucesso!');
      Writeln();
  end
  else
  begin
  	Writeln();
  	writeln('N�o � poss�vel cadastrar um novo produto! Limite de cadastro atingido.');
  	Writeln();
  end;
End;

{Fun��o respons�vel por pegar um produto atrav�s do seu c�digo}
Function PegaIndexEstoquePeloCod(var cod: integer):integer;
var
i, indexEstoque:integer;

Begin
	indexEstoque := -1;
	
	for i := 1 to 5 do
 	begin
   if (listaEstoque[i].cod = cod) then
     	 indexEstoque := i;
	end;

	 PegaIndexEstoquePeloCod:= indexEstoque;
	 
End;

{Layout default para apresenta��o de produtos}
Procedure ApresentaLayoutProduto(var index:integer);
Begin
	writeln();
	writeln('----------------------------------------------------------------------------');
	writeln('			C�DIGO PRODUTO: ', listaEstoque[index].cod);
	writeln('Descri��o: ', listaEstoque[index].descricao);
	writeln('Unidades: ', listaEstoque[index].unidades);
	writeln('Marca: ', listaEstoque[index].marca);
	writeln('Embalagem: ', listaEstoque[index].tamanho_embalagem);
	writeln('Validade: ', listaEstoque[index].validade);
	writeln('Pre�o unit�rio: ', listaEstoque[index].preco_unitario);
	writeln('Pre�o total: ', listaEstoque[index].preco_total);
	writeln('----------------------------------------------------------------------------');
	writeln();
End;

{Procedure respons�vel por atualizar produtos}
Procedure AtualizarProduto;
var
	cod, indexEstoque, tamanhoEmbalagem: integer;
	atualizar: char;
Begin
  writeln();
	writeln('Informe o c�digo do agendamento que desejas atualizar:');
	readln(cod);
	
	indexEstoque := PegaIndexEstoquePeloCod(cod);
	
	if (indexEstoque <> -1) then begin
			
			writeln();
			writeln('Produto encontrado:');
			ApresentaLayoutProduto(indexEstoque);
   		
   		writeln('Deseja atualizar a descri��o do produto? (S | N)' );
   		readln(atualizar);
   		writeln();
   		if (upcase(atualizar) = 'S') then begin
       	writeln('Informe uma nova descri��o do produto:');
		  	readln(listaEstoque[indexEstoque].descricao);
		  	writeln();
     end;
   		
		  writeln('Deseja atualizar quantidade de unidades do produtos? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova quantidade de unidades do produtos:');
			  readln(listaEstoque[indexEstoque].unidades);
			  writeln();
			 end;
		  
		  writeln('Deseja atualizar a marca do produto? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova marca para o produto:');
			  readln(listaEstoque[indexEstoque].marca);
			  writeln();
		  end;
		  
		  writeln('Deseja atualizar o tamanho de embalagem do produto? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo tamanho para o produto:');
			  writeln('[1] - Grande');
			  writeln('[2] - M�dia');
			  writeln('[3] - Pequena');
			  readln(tamanhoEmbalagem);
			  
			  case (tamanhoEmbalagem ) of 
	      1: listaEstoque[indexEstoque].tamanho_embalagem := 'Grande';
	      2: listaEstoque[indexEstoque].tamanho_embalagem := 'M�dia';
	      3: listaEstoque[indexEstoque].tamanho_embalagem := 'Pequena';
	    	end;
			  writeln();
			end;
		  
		  writeln('Deseja atualizar a validade do produto? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova validade para o produto:'); 
			  readln(listaEstoque[indexEstoque].validade);
			  writeln();
			end;
			
			writeln('Deseja atualizar o pre�o unit�rio do produto? (S | N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo pre�o unit�rio para o produto:'); 
			  readln(listaEstoque[indexEstoque].preco_unitario);
			  writeln();
			end;
		  
		  listaEstoque[indexEstoque].preco_total := (listaEstoque[indexEstoque].preco_unitario * listaEstoque[indexEstoque].unidades);
		  
      Writeln();
      Writeln('Produto atualizado com sucesso!');
   		ApresentaLayoutProduto(indexEstoque);
   		
 	end
 	
 	else
 	begin
 		writeln('C�digo de produto n�o encontrado!');
 		AtualizarProduto();
 	end;
End;
  
{Procedure respons�vel por excluir agendamentos}
Procedure ExcluirProduto;
var
	cod, indexProduto: integer;
	excluir: char;
Begin
  writeln();
	writeln('Informe o c�digo do produto que desejas excluir:');
	readln(cod);
	
	indexProduto := PegaIndexEstoquePeloCod(cod);
	
	if (indexProduto <> -1) then begin
			
			writeln();
			writeln('Tem certeza que deseja excluir este produto? (S | N)');
			
			ApresentaLayoutProduto(indexProduto);
			
			readln(excluir);
			
			if (upcase(excluir) = 'S') then begin
	     	listaEstoque[indexProduto].cod := 0;
				listaEstoque[indexProduto].descricao := '';
				listaEstoque[indexProduto].unidades := 0;
				listaEstoque[indexProduto].marca := '';
				listaEstoque[indexProduto].tamanho_embalagem := '';
				listaEstoque[indexProduto].validade := '';
				listaEstoque[indexProduto].preco_unitario := 0;
				listaEstoque[indexProduto].preco_total := 0;
				
				writeln();
				writeln('Produto exclu�do com sucesso!');
   		end
   		else
				writeln('Exclus�o cancelada!');
 	end
 	else
 	begin
 		writeln('C�digo de produto n�o encontrado!');
 		ExcluirProduto();
 	end;
End;

{Procedure respons�vel por apresentar estoque}
Procedure VisualizarEstoque();
var 
QtdProdApresentados, i: integer;
Begin
	for i := 1 to 5 do
	begin
		if (listaEstoque[i].cod <> 0) then begin
				inc(QtdProdApresentados);
				ApresentaLayoutProduto(i);
		end;
	end;
	
	if (QtdProdApresentados = 0) then
  begin
  	writeln();
  	writeln('Nenhum produto cadastrado!');
  	writeln();
  end;

End;

{Menu principal de estoque}
Procedure MenuEstoque;
var
op: integer;
Begin
	repeat
		writeln();
		writeln('					MENU DE ESTOQUE');
		writeln();
		writeln('Para cadastrar um novo produto no estoque digite 1');
		writeln('Para atualizar um produto existente no estoque digite 2');
		writeln('Para excluir produto do estoque digite 3');
		writeln('Para visualizar todos os produtos cadastrados do estoque digite 4');
		writeln('Para voltar digite 0');
		writeln();
		readln(op);
	
	  case (op) of 
	    1: CadastrarEstoque();
	    2: AtualizarProduto();
	    3: ExcluirProduto();
	    4: VisualizarEstoque();
	  end;
	until (op = 0);
End;
{------------------------------------------------------------------------------------------------------------------------------ESTOQUE------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------PROCEDIMENTO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}
{Fun��o respons�vel por identificar um lugar da array que est� dispon�vel para ser preenchido com um novo procedimento}
Function PegaIndexProcedimentoVazio():integer;
var
indexProcedimento, i: integer;
Begin
	indexProcedimento := -1;
	
	for i := 1 to 5 do
 	begin
 		if (listaProcedimentos[i].cod = 0) then
        indexProcedimento := i;	
 	end;
 	
 	 PegaIndexProcedimentoVazio := indexProcedimento;
End; 

{Procedure respons�vel por cadastrar procedimento}
Procedure CadastrarProcedimento;
var
index: integer;
Begin
  inc(cod_gerado_procedimento);
	index:= PegaIndexProcedimentoVazio;
	
	
	if (index <> -1 ) then begin
		  listaProcedimentos[index].cod := cod_gerado_procedimento;
		  
		  writeln('Informe a descri��o do procedimento:');
		  readln(listaProcedimentos[index].descricao);
		  
		  writeln('Informe o pre�o do procedimento:');
		  readln(listaProcedimentos[index].preco);
		  
		  
      Writeln();
      Writeln('procedimento cadastrado com sucesso!');
      Writeln();
  end
  
  else
  begin
  	Writeln();
  	writeln('N�o � poss�vel criar um novo procedimento! Limite de cadastro atingido.');
  	Writeln();
  end;
End;

{Fun��o respons�vel por pegar um procedimento atrav�s do seu c�digo}
Function PegaIndexProcedimentoPeloCod(var cod: integer):integer;
var
i, indexProcedimento:integer;

Begin
	indexProcedimento := -1;
	
	for i := 1 to 5 do
 	begin
   if (listaProcedimentos[i].cod = cod) then
     	 indexProcedimento := i;
	end;

	 PegaIndexProcedimentoPeloCod := indexProcedimento;	 
End;

{Layout default para apresenta��o de procedimento}
Procedure ApresentaLayoutProcedimento(var index:integer);
Begin
	writeln();
	writeln('----------------------------------------------------------------------------');
	writeln('			C�DIGO DO PROCEDIMENTO: ', listaProcedimentos[index].cod);
	writeln('Descri��o do procedimento: ', listaProcedimentos[index].descricao);
	writeln('Pre�o: ', listaProcedimentos[index].preco);
	writeln('----------------------------------------------------------------------------');
	writeln();
End;

{Procedure respons�vel por atualizar procedimentos}
Procedure AtualizarProcedimento;
var
	indexProcedimento, cod: integer;
	atualizar: char;
Begin
  writeln();
	writeln('Informe o c�digo do procedimento que desejas atualizar:');
	readln(cod);
	
	indexProcedimento := PegaIndexProcedimentoPeloCod(cod);
	
	if (indexProcedimento <> -1) then begin
			
			writeln();
			writeln('Procedimento encontrado:');
			ApresentaLayoutProcedimento(indexProcedimento);
   		
   		writeln('Deseja atualizar a descri��o do procedimento? (S|N)' );
   		readln(atualizar);
   		writeln();
   		if (upcase(atualizar) = 'S') then begin
       	writeln('Informe uma nova descri��o para o procedimento:');
		  	readln(listaProcedimentos[indexProcedimento].descricao);
		  	writeln();
     end;
   		
		  writeln('Deseja atualizar o pre�o do procedimento? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo pre�o para o procedimento:');
			  readln(listaProcedimentos[indexProcedimento].preco);
			  writeln();
			 end;
		  
      Writeln();
      Writeln('Procedimento atualizado com sucesso!');
   		ApresentaLayoutProcedimento(indexProcedimento);
   		
 	end
 	
 	else
 	begin
 		writeln('C�digo do procedimento n�o encontrado!');
 		AtualizarProcedimento();
 	end;
End;
 
{Procedure respons�vel por excluir procedimento}
Procedure ExcluirProcedimento;
var 
	indexProcedimento, cod: integer;
	excluir: char;
Begin
  writeln();
	writeln('Informe o c�digo do procedimento que desejas excluir:');
	readln(cod);
	
	indexProcedimento := PegaIndexProcedimentoPeloCod(cod);
	
	if (indexProcedimento <> -1) then begin
			
			writeln();
			writeln('Tem certeza que deseja excluir este procedimento? (S | N)');
			
			ApresentaLayoutProcedimento(indexProcedimento);
			
			readln(excluir);
			
			if (upcase(excluir) = 'S') then begin
	     	listaProcedimentos[indexProcedimento].cod := 0;
				listaProcedimentos[indexProcedimento].descricao := '';
				listaProcedimentos[indexProcedimento].preco := 0;
				
				writeln();
				writeln('Procedimento exclu�do com sucesso!');
   		end
   		else
				writeln('Exclus�o cancelada!');
 	end
 	else
 	begin
 		writeln('C�digo do procedimento n�o encontrado!');
 		ExcluirProcedimento();
 	end;
End;

{Procedure respons�vel por apresentar procedimento}
Procedure VisualizarProcedimentos();
var 
QtdProcedimentosApresentados, i: integer;
Begin
	for i := 1 to 5 do
	begin
		if (listaProcedimentos[i].cod <> 0) then begin
				inc(QtdProcedimentosApresentados);
				ApresentaLayoutProcedimento(i);
		end;
	end;
	
	if (QtdProcedimentosApresentados = 0) then
  begin
  	writeln();
  	writeln('Nenhum procedimento cadastrado!');
  	writeln();
  end;

End;

{Menu principal de procedimento}
Procedure MenuProcedimentos;
var
op: integer;
Begin
	repeat
		writeln();
		writeln('					MENU DE PROCEDIMENTOS');
		writeln();
		writeln('Para cadastrar um novo procedimento digite 1');
		writeln('Para atualizar um procedimento existente digite 2');
		writeln('Para excluir procedimento digite 3');
		writeln('Para visualizar todos os procedimentos cadastrados digite 4');
		writeln('Para voltar digite 0');
		writeln();
		readln(op);
	
	  case (op) of 
	    1: CadastrarProcedimento();
	    2: AtualizarProcedimento();
	    3: ExcluirProcedimento();
	    4: VisualizarProcedimentos();
	  end;
	until (op = 0);
End;
{------------------------------------------------------------------------------------------------------------------------------PROCEDIMENTO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------AGENDAMENTO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}
{Fun��o respons�vel por identificar um lugar da array que est� dispon�vel para ser preenchido com um novo agendamento}
Function PegaIndexAgendamentoVazio():integer;
var
indexAgend, i: integer;
Begin
	indexAgend := -1;
	
	for i := 1 to 5 do
 	begin
 		if (listaAgendamentos[i].cod = 0) then
        indexAgend := i;
					
 	end;
 	
 	 PegaIndexAgendamentoVazio := indexAgend;
End; 

{Procedure respons�vel por cadastrar agentamentos}
Procedure CadastrarAgendamento;
var
index, indexProcedimento: integer;
data, hora:string;
Begin
	inc(cod_gerado_agendamento);
	index:= PegaIndexAgendamentoVazio;
	
	
	if (index <> -1 ) then begin
		  listaAgendamentos[index].cod := cod_gerado_agendamento;
		  
		  writeln('Informe o c�digo do procedimento:');
		  readln(listaAgendamentos[index].cod_procedimento);
		  
		  writeln('Informe a quantidade de procedimentos:');
		  readln(listaAgendamentos[index].qtd_procedimento);
		  
		  writeln('Informe o CPF do paciente:');
		  readln(listaAgendamentos[index].cpf_paciente);
		  
		  writeln('Informe o CRO do dentista:');
		  readln(listaAgendamentos[index].cro_dentista);
		  
		  writeln('Informe a data de agendamento:');
		  readln(data);
		  
		  writeln('Informe a hora de agendamento:');
		  readln(hora);
		  
		  listaAgendamentos[index].dataHora := concat(data, ' as ', hora);
		  
		  
		  indexProcedimento := PegaIndexProcedimentoPeloCod(listaAgendamentos[index].cod_procedimento);
		  listaAgendamentos[index].total_pagamento := (listaProcedimentos[indexProcedimento].preco * listaAgendamentos[index].qtd_procedimento); 
		  
      Writeln();
      Writeln('Agendamento cadastrado com sucesso!');
      Writeln();
  end
  else
  begin
  	Writeln();
  	writeln('N�o � poss�vel criar um novo agendamento! Limite de cadastro atingido.');
  	Writeln();
  end;
End;

{Fun��o respons�vel por pegar um agendamento atrav�s do seu c�digo}
Function PegaIndexAgendamentoPeloCod(var cod: integer):integer;
var
i, indexAgend:integer;

Begin
	indexAgend := -1;
	
	for i := 1 to 5 do
 	begin
   if (listaAgendamentos[i].cod = cod) then
     	 indexAgend := i;
	end;

	 PegaIndexAgendamentoPeloCod:= indexAgend;	 
End;

{Layout default para apresenta��o de agendamentos}
Procedure ApresentaLayoutAgendamento(var index:integer);
Begin
	writeln();
	writeln('----------------------------------------------------------------------------');
	writeln('			C�DIGO AGENDAMENTO: ', listaAgendamentos[index].cod);
	writeln('C�digo procedimento: ', listaAgendamentos[index].cod_procedimento);
	writeln('CPF paciente: ', listaAgendamentos[index].cpf_paciente);
	writeln('CRO dentista: ', listaAgendamentos[index].cro_dentista);
	writeln('Data e hora do agendamento: ', listaAgendamentos[index].dataHora);
	writeln('Quantidade de procedimentos: ', listaAgendamentos[index].qtd_procedimento);
	writeln('Total a pagar: ', listaAgendamentos[index].total_pagamento);
	writeln('----------------------------------------------------------------------------');
	writeln();
End;

{Procedure respons�vel por atualizar agendamentos}
Procedure AtualizarAgendamento;
var
	cod, indexAgend, indexProcedimento: integer;
	atualizar: char;
	data, hora: string;
Begin
  writeln();
	writeln('Informe o c�digo do agendamento que desejas atualizar:');
	readln(cod);
	
	indexAgend := PegaIndexAgendamentoPeloCod(cod);
	
	if (indexAgend <> -1) then begin
			
			writeln();
			writeln('Agendamento encontrado:');
			ApresentaLayoutAgendamento(indexAgend);
   		
   		writeln('Deseja atualizar c�digo do procedimento? (S|N)' );
   		readln(atualizar);
   		writeln();
   		if (upcase(atualizar) = 'S') then begin
       	writeln('Informe um novo c�digo do procedimento:');
		  	readln(listaAgendamentos[indexAgend].cod_procedimento);
		  	writeln();
     end;
   		
		  writeln('Deseja atualizar quantidade de procedimentos? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova quantidade de procedimentos:');
			  readln(listaAgendamentos[indexAgend].qtd_procedimento);
			  writeln();
			 end;
		  
		  writeln('Deseja atualizar CPF do paciente? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo CPF do paciente:');
			  readln(listaAgendamentos[indexAgend].cpf_paciente);
			  writeln();
		  end;
		  
		  writeln('Deseja atualizar CRO do dentista? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe um novo CRO do dentista:');
			  readln(listaAgendamentos[indexAgend].cro_dentista);
			  writeln();
			end;
		  
		  writeln('Deseja atualizar data de agendamento? (S|N)');
		  readln(atualizar);
		  writeln();
   		if (upcase(atualizar) = 'S' ) then begin
			  writeln('Informe uma nova data de agendamento:'); 
			  readln(data);
			  writeln();
			  
			  writeln('Informe uma nova hora de agendamento:');
			  readln(hora);
			  writeln();
			  
			  listaAgendamentos[indexAgend].dataHora := concat(data, ' as ', hora);
			end;
		  
		  indexProcedimento := PegaIndexProcedimentoPeloCod(listaAgendamentos[indexAgend].cod_procedimento);
		  listaAgendamentos[indexAgend].total_pagamento := (listaProcedimentos[indexProcedimento].preco * listaAgendamentos[indexAgend].qtd_procedimento); 
		  
      Writeln();
      Writeln('Agendamento atualizado com sucesso!');
   		ApresentaLayoutAgendamento(indexAgend);
   		
 	end
 	
 	else
 	begin
 		writeln('C�digo de agendamento n�o encontrado!');
 		AtualizarAgendamento();
 	end;
End;
  
{Procedure respons�vel por excluir agendamentos}
Procedure ExcluirAgendamento;
var
	cod, indexAgend: integer;
	excluir: char;
Begin
  writeln();
	writeln('Informe o c�digo do agendamento que desejas excluir:');
	readln(cod);
	
	indexAgend := PegaIndexAgendamentoPeloCod(cod);
	
	if (indexAgend <> -1) then begin
			
			writeln();
			writeln('Tem certeza que deseja excluir este agendamento? (S | N)');
			
			ApresentaLayoutAgendamento(indexAgend);
			
			readln(excluir);
			
			if (upcase(excluir) = 'S') then begin
	     	listaAgendamentos[indexAgend].cod := 0;
				listaAgendamentos[indexAgend].cod_procedimento := 0;
				listaAgendamentos[indexAgend].cpf_paciente := '';
				listaAgendamentos[indexAgend].cro_dentista := '';
				listaAgendamentos[indexAgend].dataHora := '';
				listaAgendamentos[indexAgend].qtd_procedimento := 0;
				listaAgendamentos[indexAgend].total_pagamento := 0;
				
				writeln();
				writeln('Agendamento exclu�do com sucesso!');
   		end
   		else
				writeln('Exclus�o cancelada!');
 	end
 	else
 	begin
 		writeln('C�digo de agendamento n�o encontrado!');
 		ExcluirAgendamento();
 	end;
End;

{Procedure respons�vel por apresentar agendamentos}
Procedure VisualizarAgendamentos();
var 
QtdAgendApresentados, i: integer;
Begin
	for i := 1 to 5 do
	begin
		if (listaAgendamentos[i].cod <> 0) then begin
				inc(QtdAgendApresentados);
				ApresentaLayoutAgendamento(i);
		end;
	end;
	
	if (QtdAgendApresentados = 0) then
  begin
  	writeln();
  	writeln('Nenhum agendamento cadastrado!');
  	writeln();
  end;
End;

{Menu principal de Agendamentos}
Procedure MenuAgendamentos;
var
op: integer;
Begin
	repeat
		writeln();
		writeln('					MENU DE AGENDAMENTOS');
		writeln();
		writeln('Para cadastrar um novo agendamento digite 1');
		writeln('Para atualizar um agendamento existente digite 2');
		writeln('Para excluir agendamento digite 3');
		writeln('Para visualizar todos os agendamentos cadastrados digite 4');
		writeln('Para voltar digite 0');
		writeln();
		readln(op);
	
	  case (op) of 
	    1: CadastrarAgendamento();
	    2: AtualizarAgendamento();
	    3: ExcluirAgendamento();
	    4: VisualizarAgendamentos();
	  end;
	until (op = 0);
End;
{------------------------------------------------------------------------------------------------------------------------------AGENDAMENTO------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------Entrada E SAIDA------------------------------------------------------------------------------------------------------------------------------------------------------------------------}
Function GastosFuncionarios: real;
var
	gastos: real;
	i: integer;
Begin
	for i := 1 to 5 do
		gastos := gastos + listaFuncionario[i].salario;

  GastosFuncionarios := gastos;  
End;

Function GastosEstoque: real;
var
	gastos: real;
	i: integer;
Begin
	for i := 1 to 5 do
		gastos := gastos + listaEstoque[i].preco_total;
	
	GastosEstoque := gastos;	
End;

procedure GastosTotais;
Begin
	writeln();
	writeln('Total gasto com Estoque foi de: $', GastosEstoque:2:2);
	writeln();
	writeln('Total gasto com Funcion�rios foi de: $', GastosFuncionarios:2:2);
	writeln();
End;

Procedure TotalArregadadoBruto;
var
	TotalArrecadado: real;
	i: integer;
Begin
	for i := 1 to 5 do
		TotalArrecadado := TotalArrecadado + listaAgendamentos[i].total_pagamento;

	writeln();
	writeln('Saldo bruto adquirido foi de: $', TotalArrecadado:2:2);
	writeln();
End;

Procedure TotalArregadadoLiquido;
var
	TotalArrecadadoBruto, totalArrecadado: real;
	i: integer;
Begin
	for i := 1 to 5 do
		TotalArrecadadoBruto := TotalArrecadadoBruto + listaAgendamentos[i].total_pagamento;

  totalArrecadado := TotalArrecadadoBruto - (GastosEstoque() + GastosFuncionarios());
	writeln();
	writeln('Saldo liquido adquirido foi de: $', totalArrecadado:2:2 );
	writeln();
End;

Procedure MenuControleEntradaSaida;
var
op: integer;
Begin
  repeat
		writeln();
		writeln('					MENU DE ENTRADA E SAIDA');
		writeln();
		writeln('[1] - Para verificar os gasto');
		writeln('[2] - Para verificar o saldo bruto recebido');
		writeln('[3] - Para verificar o saldo l�quido');
		writeln('[0] - Para voltar');
		writeln();
		readln(op);
  
	  case (op) of 
	    1: GastosTotais();
	    2: TotalArregadadoBruto();
	    3: TotalArregadadoLiquido();
	    0: VisualizarAgendamentos();
	  end;
	until (op = 0);
End;
{------------------------------------------------------------------------------------------------------------------------------ENTRADA E SAIDA------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------------------------------------------------------MENU PRINCIPAL------------------------------------------------------------------------------------------------------------------------------------------------------------------------}																																																								
Procedure MenuPrincipal();
Begin
	writeln('		Bem vindo(a) ao consult�rio odontol�gico!');
	writeln();
	repeat
		writeln('					MENU PRINCIPAL');
		writeln();
		writeln('[1] - Para entrar no menu de Pacientes');
		writeln('[2] - Para entrar no menu de Funcion�rios');
		writeln('[3] - Para entrar no menu de Estoque');
		writeln('[4] - Para entrar no menu de Procedimentos');
		writeln('[5] - Para entrar no menu de Agendamentos');
		writeln('[6] - Para entrar no menu de Controle de Entrada e Sa�da');
		writeln('[0] - Para finalizar o programa');
		readln(opcao);
		
		case (opcao) of 
		  1:  MenuPacientes;
		  2:  MenuFuncionarios;
		  3:  MenuEstoque;
		  4:  MenuProcedimentos;
		  5:  MenuAgendamentos;
		  6:  MenuControleEntradaSaida;
		end;
	until (opcao = 0);
  writeln('					Programa Encerrado!');
	readln();
End;
{------------------------------------------------------------------------------------------------------------------------------MENU PRINCIPAL------------------------------------------------------------------------------------------------------------------------------------------------------------------------}

Begin
	MenuPrincipal();
End.