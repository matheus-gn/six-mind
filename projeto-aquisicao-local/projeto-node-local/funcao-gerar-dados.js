const comandos = require(`./funcao-envio-banco`);

const intervalo_geracao_aleatoria_segundos = 10; // intervalo, em segundos, no qual os dados aleatórios serão gerados

function gerar_dados() {
    console.log('\nGerando valores aleatórios!');

    comandos.registrar_leitura(Math.random() * (30 - 20) + 20, Math.random() * (85 - 50) + 50); // exemplo para temperatura e umidade
    // registrar_leitura(Math.random(1023)+1); // exemplo para luminosidade
    // registrar_leitura(parseInt(Math.random(2))); // exemplo para presença
    
    setTimeout(function() {
       gerar_dados(); 
	}, intervalo_geracao_aleatoria_segundos * 1000);
}

module.exports = {
    gerar_dados: gerar_dados
}
