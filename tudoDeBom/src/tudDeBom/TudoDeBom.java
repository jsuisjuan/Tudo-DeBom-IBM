package tudDeBom;

import java.util.Scanner;

public class TudoDeBom {

	public static ConnectionBancoDeDados sintaxe = new ConnectionBancoDeDados();

	public static void main(String[] args) {
		int id;
		String nome;
		Scanner sc = new Scanner(System.in);
		int opcao;
		sintaxe.conectar();

		do {
			System.out.println("Escolha uma das opções: ");
			System.out.println("1 - Adicionar cliente");
			System.out.println("2 - Atualizar Cliente");
			System.out.println("3 - Deletar Cliente");
			System.out.println("4 - Lista de Clientes");
			System.out.println("5 - Sair");
			opcao = sc.nextInt();

			switch (opcao) {
			case 1:

				break;
			case 2:
				System.out.println("Digite o nome do cliente");
				nome = sc.next();
				System.out.println("Digite o id do cliente");
				id = sc.nextInt();
				atualizaCliente(nome, id);
				break;
			case 3:

				break;
			case 4:

				break;
			case 5:
				System.out.println("Saindo...");
				break;
			default:
				System.out.println("Opção invalida");

				break;
			}
		} while (opcao != 5);
		sc.close();
	}

	public static void atualizaCliente(String nome, int id) {

		if (sintaxe.estadoConectado()) {
			sintaxe.atualizarCliente(nome, id);
			System.out.println("Cliente Atualizado!");

		} else {
			System.out.println("Erro ao atualizar o cliente");
		}
	}
}
