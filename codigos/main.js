const SIM = true;
const NÃO = false;

$(document).ready(function()
{
    return;
});

function tela_de_carregamento(exibir)
{
    if ($("#tela_de_carregamento").length === 1)
    {
        if (exibir === SIM)
        {
            const tela_de_carregamento = $("#tela_de_carregamento");
            tela_de_carregamento.show();
        }
        else if (exibir === NÃO)
        {
            const tela_de_carregamento = $("#tela_de_carregamento");
            tela_de_carregamento.hide();
        }
    }
    else
    {
        $.get("/redesocialetec/paginas/tela_de_carregamento.html", function(dados, situacao, xhr)
        {
            if (exibir === NÃO) dados = $(dados).hide();
            $("body").append(dados);
        });
    }
};

/*
document.addEventListener("DOMContentLoaded", function () {
    const botao_iniciar_sessao = document.getElementById(1);
    const botao_encerrar_sessao = document.getElementById(2);

    botao_iniciar_sessao.addEventListener("mousedown", async function (event) {
        event.preventDefault();

    });

    const senha = "suaSenhaAqui";
    const senhaEncriptada = btoa(senha);

    fetch(location.origin + "/iniciar_sessao", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ senha: senhaEncriptada }),
    });
    botao_encerrar_sessao.addEventListener("mousedown", async function (event) {
        event.preventDefault();

    });
    fetch(location.origin + "/encerrar_sessao", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ acao: "encerrar" }),
    });
});*/