$(document).ready(function()
{
    //tela_de_carregamento(SIM);
    inicializar_botao();
    //tela_de_carregamento(NÃO);
});

function inicializar_botao()
{
    const botao_enviar = $("#enviar");
    botao_enviar.click(function(event)
    {
        event.preventDefault();
        fazer_login();
    });
};

function fazer_login()
{
    const input_usuario = $("#usuario");
    const input_senha = $("#senha");
    const usuario = input_usuario.val().trim();
    const senha = input_senha.val().trim();
    if (!usuario || !senha) return erro_de_login(etapa = 1);
    const usuario_encriptado = btoa(usuario);
    const senha_encriptada = btoa(senha);
    const dados_de_login = {
        usuario: usuario_encriptado,
        senha: senha_encriptada
    };
    $.ajax(
    {
        url: "/redesocialetec/processos/login.php",
        method: "POST",
        body: dados_de_login,
        success: function(dados, situacao, xhr)
        {
            
        },
        error: function(xhr, situacao, erro){}
    });
};

function erro_de_login(etapa)
{
    if ("number" !== typeof etapa) throw new TypeError("Etapa deve ser um número.");
};

function login_realizado(){};
