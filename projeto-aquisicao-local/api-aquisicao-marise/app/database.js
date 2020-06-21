var configuracoes = {
    server: "srvprojsixminds.database.windows.net",
    user: "adminlocal",
    password: "#Sixminds2020",
    database: "bancoProjSixMinds",
    options: {
      encrypt: true,
      enableArithAbort: true,
    },
    pool: {
      max: 4,
      min: 1,
      idleTimeoutMillis: 30000,
      connectionTimeout: 5000,
    },
};

var sql = require("mssql");
sql.on("error", (err) => {
  console.error(`Erro de Conexão: ${err}`);
});

function conectar() {
  sql.close();
  return sql.connect(configuracoes);
}

module.exports = {
  conectar: conectar,
  sql: sql,
};
