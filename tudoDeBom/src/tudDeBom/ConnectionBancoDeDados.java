package tudDeBom;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnectionBancoDeDados {

	private Connection connection = null;
	private Statement statement = null;
//	private ResultSet resulSet = null;
	
	public void conectar() {
		// Criação da variavel para conctar ao database
		String servidor = "jdbc:mysql://localhost/tudodebom2";
		String usuario = "root";
		String senha = "root";
		String driver = "com.mysql.cj.jdbc.Driver";

		// Permite verificar o tratamento da exceção caso ok banco de dados
		try {
			Class.forName(driver);
			this.connection = DriverManager.getConnection(servidor, usuario, senha);
			statement = this.connection.createStatement();

		} catch (Exception e) {
			System.out.println("Erro: " + e.getMessage());
		}
	}
	

	public boolean estadoConectado() {
		if (this.connection != null) {
			return true;
		} else {
			return false;
		}

	}
	
	public void deletarCliente(int id) {
		try {
			String query = "DELETE FROM cliente WHERE id = '" + id + "' ;";
			System.out.println(query);
			this.statement.execute(query);
			System.out.println("Cliente deletado");
		} catch (Exception e) {
			System.out.println("Erro ao deletar o id = " + id + e.getMessage());
		}
	}
	
	

}
