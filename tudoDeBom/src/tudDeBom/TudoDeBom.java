package tudDeBom;

import java.util.Scanner;

public class TudoDeBom {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int id;
		ConnectionBancoDeDados sintaxe = new ConnectionBancoDeDados();
		sintaxe.conectar();
		
		if(sintaxe.estadoConectado()) {
			System.out.println("Qual o id do cliente que quer excluir?");
			id = sc.nextInt();
			sintaxe.deletarCliente(id);
		}else {
			System.out.println("Erro ao deletar o cliente");
		}
		sc.close();
		
	}

}
