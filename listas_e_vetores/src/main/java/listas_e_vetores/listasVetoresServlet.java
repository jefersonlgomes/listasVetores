package listas_e_vetores;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/listasVetores")
public class listasVetoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String numeroEscolhidoStr = "";
		String posicaoSomatorio = "";
		try {
			
			numeroEscolhidoStr = req.getParameter("numeroEscolhido");
			posicaoSomatorio = req.getParameter("posicaoSomatorio");
			
			Integer numeroEscolhido = validaDadosRecebidos(numeroEscolhidoStr, posicaoSomatorio);
			
			Vector<Integer> lista = geraLista(numeroEscolhido);
			
			Integer somatorio = getSomatorio(posicaoSomatorio, lista);
			
			req.setAttribute("numeroEscolhido", numeroEscolhidoStr);
			req.setAttribute("posicaoSomatorio", posicaoSomatorio);
			req.setAttribute("listaGerada", lista);
			req.setAttribute("somatorio", somatorio);
			RequestDispatcher dispatcher = req.getRequestDispatcher("listaGerada.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			req.setAttribute("msgErro", "Erro: "+e.getLocalizedMessage());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
		}
		
	}

	private Integer validaDadosRecebidos(String numeroEscolhidoStr, String posicaoSomatorio) {
		if(numeroEscolhidoStr == null) {
			throw new IllegalArgumentException("Número não informado!");				
		}
		
		if(posicaoSomatorio == null) {
			throw new IllegalArgumentException("Posição para somatório não informado!");				
		}
		boolean isNumeric = numeroEscolhidoStr.chars().allMatch( Character::isDigit );
		
		if(!isNumeric) {
			throw new IllegalArgumentException("O valor informado no campo não é um número válido!");
		}
		Integer numeroEscolhido = Integer.valueOf(numeroEscolhidoStr.toString());
		
		if(numeroEscolhido > 1000 || numeroEscolhido < 100) {
			throw new IllegalArgumentException("O valor informado está fora do intervalo entre 100 e 1000!");
		}
		return numeroEscolhido;
	}

	private Vector<Integer> geraLista(Integer numeroEscolhido) {
		Vector<Integer> lista = new Vector<Integer>();
		for(int i= 1; i <= 10; i++) {
			Integer numeroCalculado = 0;
			if(i%3 == 0){ 
				numeroCalculado = i*(numeroEscolhido*3/10);
			} else {
				numeroCalculado = i*(numeroEscolhido/10);
			}
			lista.add(numeroCalculado);
		}
		return lista;
	}

	private Integer getSomatorio(String posicaoSomatorio, Vector<Integer> lista) {
		Integer somatorio = 0;
		
		for(int i= 0; i <= 9; i++) {
			
			if(posicaoSomatorio.equals("Impares") &&  !numeroPar(i+1)) { // somatório de posições impares
				somatorio += lista.get(i);
			}
			if(posicaoSomatorio.equals("Pares") && numeroPar(i+1)) { // somatório de posições pares
				somatorio += lista.get(i);
			}
		}
		return somatorio;
	}
	
	private static boolean numeroPar(int i) {
		return i%2==0;
	}
	
}
