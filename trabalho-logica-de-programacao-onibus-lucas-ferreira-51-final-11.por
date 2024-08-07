programa {

    //variaveis global 
    cadeia assentos[11][4] 
    inteiro i,j 
   
    //primeira função
    funcao vazio cabecalho()
    {
      escreva("\n======Bem Vindo ao Sistema de Viagem de ônibus======\n")
    }

    //função de inicializar
    funcao vazio inicializar()
    {
      //colocando todos os assentos livres

    para (i=0; i<11; i++)
    {
      para (j=0; j<4;j++) 
      {
        assentos[i][j] = "L"
      }
    }
    //promoção de assento para idoso
    assentos[0][0] = "IL"
    assentos[6][3] = "IL"
    assentos[10][0] = "IL"

    //promoção de assento para PCD
    assentos[5][0] = "PL"
    assentos[0][2] = "PL"

    //promoção de assento para criança
    assentos[8][1] = "CL"
    assentos[4][3] = "CL"

    }
    funcao vazio mapa()
    {  //função para mostrar o mapa 
    limpa()
      escreva ("\n======>>>>Mapa dos assentos<<<<====== \n")
      escreva("\n")
      escreva("Coluna|")
      para (j=0; j<4; j++)
      {
        escreva(j+1 ," | ")
      }
       para (i=0; i<11; i++)
      {
        escreva ("\n")
        escreva("|F ", i+1, "| ")
        para (j=0; j<4; j++)
        {
          escreva(assentos[i][j]," | ")
        }
      }
              escreva ("\n======================")
              escreva ("\nL = Assento normal livre")
              escreva ("\nIL = Assento para idoso livre")
              escreva ("\nPL = Assento para PCD livre")
              escreva ("\nCL = Assento para criança livre")
              escreva ("\n\n obs: L- Livre / O- Ocupado")
      

    }

  funcao inicio() {
    //variavel
    cadeia pausa, pcd
    inteiro opcao, senha, menu2, confirma
    inteiro idade, valor_assento, cont_L, cont_O
    real total_comprados, desconto_I, desconto_PCD, desconto_C

    //inicializando
    opcao = 0
    confirma = 0
    total_comprados = 0
    valor_assento = 200
    desconto_I = 0 
    desconto_PCD = 0 
    desconto_C = 0
    cont_L = 0
    cont_O = 0  
    inicializar()

    //a senha para iniciar o programa e "12345"
    escreva("Digite a senha de acesso: ")
    leia(senha)
    se (senha == 12345) 
    {
      cabecalho()
      escreva ("\nAperte ENTER para acessar ")
      leia(pausa)

    //menu
    enquanto (opcao !=5 )
    { 
    limpa()
    escreva("\n======>>>Menu<<<======\n")
    escreva ("\n1- Mapa dos assentos ")
    escreva ("\n2- Comprar assento ")
    escreva ("\n3- Cancelar compra ")
    escreva ("\n4- Relatorio ")
    escreva ("\n5- Sair ")
    escreva ("\nEscolha a opção desejada: ")
    leia (opcao)

    escolha (opcao) 
    {
      //mapa dos assentos
      caso 1:
      mapa()
      escreva("\n\nAperte ENTER para voltar ao menu")
      leia(pausa)
     
      pare

      caso 2:
      //comprar assento (segundo menu)
      enquanto (menu2 != 5)
      {
        limpa()
        mapa()
        escreva("\n\n======>>>Comprar assento<<<=======")
        escreva ("\n1- Comprar assento normal ")
        escreva ("\n2- Comprar assento para idoso (30% de desconto, desconto valido apenas com a validação da idade (com idade igual ou superior a 60)) ")
        escreva ("\n3- Comprar assento para PCD (25% de desconto)")
        escreva ("\n4- Compra assento para criança (50% de desconto, desconto valido apenas com a validação da idade (até 12 anos) )")
        escreva ("\n5- Sair ")
        escreva ("\nEscolha a opção desejada: ")
        leia (menu2)

        escolha (menu2)
        {
          caso 1:
          //compra de assento normal
          limpa()
          escreva ("De 1 a 11 digite a fileira do assento para compralo: ")
          leia (i)
          i--
          
          escreva("De 1 a 4 digite coluna em que se encontra o assento para compralo: ")
          leia (j)
          j--
          
           se (i >=0 e i <=10 e j >=0 e j<=3) 
            {

            se (assentos[i][j] == "L" ) 
              { 
                  //confirmar compra
                   escreva("Assento livre, desja compralo ? 1- Sim/2- Não: ")
                   leia (confirma)
                   se (confirma == 1) 
                   {
                    escreva ("\nCompra realizada!\n")
                    total_comprados = total_comprados + valor_assento
                    assentos[i][j] = "O"
                   }
               } 
                senao 
                 {
                   escreva ("Assento ocupado ou prioritário ou os números digitados estão invalidos ")
                 }
          }
          senao 
          {
            escreva ("Assento ocupado ou prioritário ou os números digitados estão invalidos ")
          }
          escreva("\nAperte ENTER para voltar ao menu")
          leia(pausa)
          pare 

          caso 2:
          //comprar assento de idoso
          limpa()
          escreva ("Digite sua idade para comprar um assento de idoso: ")
          leia (idade)

          //confirmar idade 
          se (idade >= 60) 
          { 
            escreva ("Os assentos para idoso são os da fileira 1 coluna 1, fileira 7 coluna 4 e fileira 11 coluna 1  \n")
            escreva ("Digite o número da fileira: ")
            leia (i)
            i--
            escreva ("Digite o número da coluna: ")
            leia (j)
              j--
            se (i >=0 e i <=10 e j >=0 e j<=3) 
            {
            se (i == 0 ou j == 0 ou i == 6 ou j == 3 ou i == 10 )
            {
              se (assentos[i][j] == "IL")
              {
                //confirmar compra 
                escreva("Assento livre, desja compralo ? 1- Sim/2- Não: ")
                   leia (confirma)
                   se (confirma == 1) 
                   {
                    escreva ("\nCompra realizada!\n")
                    desconto_I = (valor_assento*30)/100
                    desconto_I = valor_assento - desconto_I
                    total_comprados = total_comprados + desconto_I
                    assentos[i][j] = "IO"
                   }
              }
              senao
              {
                escreva ("Assento ocupado ou os números digitados estão invalidos ")
              }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }

          }
          senao 
          {
            escreva ("Idade invalida para a promoção")
          }
          escreva("\nAperte ENTER para voltar ao menu")
          leia(pausa)

          pare

          caso 3:
          //comprar assento PCD
          limpa()
          escreva("Digite a sua deficiência: ")
          leia (pcd)
          escreva ("Os assentos para PCD são os da fileira 6 coluna 1 e fileira 1 coluna 3 \n")
          escreva ("Digite o número da fileira: ")
            leia (i)
            i--
            escreva ("Digite o número da coluna: ")
            leia (j)
            j--

            se ( i >=0 e i <=10 e j >=0 e j<=3) 
            { 
            se (i == 5 ou j == 0 ou i == 0 ou j == 2 )
            {
              se (assentos[i][j] == "PL")
              {
                //confirmar compra 
                escreva("Assento livre, desja compralo ? 1- Sim/2- Não: ")
                   leia (confirma)
                   se (confirma == 1) 
                   {
                    escreva ("\nCompra realizada!\n")
                    desconto_PCD = (valor_assento*25)/100
                    desconto_PCD = valor_assento - desconto_PCD
                    total_comprados = total_comprados + desconto_PCD
                    assentos[i][j] = "PO"
                   }
              }
              senao
              {
                escreva ("Assento ocupado ou os números digitados estão invalidos ")
              }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }
            escreva("\nAperte ENTER para voltar ao menu")
            leia(pausa)
          pare

          caso 4:
          //comprar assento para criança
          limpa()
          escreva ("Digite a idade da criança para comprar o assento: ")
          leia (idade)

          //confirmar idade 
          se (idade <= 12 ) 
          { 
            escreva ("Os assentos para criança são os da fileira 9 coluna 2, fileira 5 coluna 4 \n")
            escreva ("Digite o número da fileira: ")
            leia (i)
            i--
            escreva ("Digite o número da coluna: ")
            leia (j)
            j--

             se (i >=0 e i <=10 e j >=0 e j<=3) 
            { 

            se (i == 8 ou j == 1 ou i == 4 ou j == 3 )
            {
              se (assentos[i][j] == "CL")
              {
                //confirmar compra 
                escreva("Assento livre, desja compralo ? 1- Sim/2- Não: ")
                   leia (confirma)
                   se (confirma == 1) 
                   {
                    escreva ("\nCompra realizada!\n")
                    desconto_C = (valor_assento*50)/100
                    desconto_C = valor_assento - desconto_C
                    total_comprados = total_comprados + desconto_C 
                    assentos[i][j] = "CO"
                   }
              }
              senao
              {
                escreva ("Assento ocupado ou os números digitados estão invalidos ")
              }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }
            }
            senao 
            {
              escreva ("Assento ocupado ou os números digitados estão invalidos ")
            }

          }
          senao 
          {
            escreva ("Idade invalida para a promoção")
          }
          escreva("\nAperte ENTER para voltar ao menu")
          leia(pausa)

          pare


        }


      }
       
      pare

      caso 3:
      //cancelar compra
      mapa()
      escreva ("\nDigite a fileira: ")
      leia (i)
      i--
      escreva ("Digite a coluna: ")
      leia (j)
      j--
      se (i <=11 e j<=4)
      {
        se (assentos[i][j] == "O")
        {
          escreva ("Deseja cancelar a compra? 1-Sim/2-Não ")
          leia (confirma)
          se (confirma ==1)
          {
            escreva("\nCompra cancelada!\n")
            total_comprados = total_comprados - valor_assento
            assentos[i][j] = "L"
          }
        }
        senao se(assentos[i][j] == "IO") 
        {
          escreva ("Deseja cancelar a compra? 1-Sim/2-Não ")
          leia (confirma)
          se (confirma ==1)
          {
            escreva("Compra cancelada")
            total_comprados = total_comprados - desconto_I
            assentos[i][j] = "IL"
          }
        }
        senao se(assentos[i][j] == "PO") 
        {
          escreva ("Deseja cancelar a compra? 1-Sim/2-Não ")
          leia (confirma)
          se (confirma ==1)
          {
            escreva("\nCompra cancelada!\n")
            total_comprados = total_comprados - desconto_PCD
            assentos[i][j] = "PL"
          }
        }
        senao se(assentos[i][j] == "CO") 
        {
          escreva ("Deseja cancelar a compra? 1-Sim/2-Não ")
          leia (confirma)
          se (confirma ==1)
          {
            escreva("\nCompra cancelada!\n")
            total_comprados = total_comprados - desconto_C
            assentos[i][j] = "CL"
          }
        }

      }
      senao
      {
        escreva("Números digitados estão invalidos!")
      }
      escreva("\nAperte ENTER para voltar ao menu")
      leia(pausa)

      pare
      
      caso 4:
      //relatorio
      para (i=0;i<11;i++)
        {
          para (j=0;j<4;j++)
          {
            se (assentos[i][j]=="L" ou assentos[i][j]== "IL" ou assentos[i][j]=="PL" ou assentos[i][j]== "CL")
            {
              cont_L++
            }
            senao
            {
              cont_O++
            }
          }
        }
          escreva("\n Total de assentos livres: ", cont_L , " - ",(cont_L*100/(cont_L+cont_O)),"%" )
          escreva("\n Total de assentos ocupado: ", cont_O, " - ",(cont_O*100/(cont_L+cont_O)),"%")
          escreva("\n Valor arrecadado até o momento: R$", total_comprados)

          escreva("\nAperte ENTER para voltar ao menu")
          leia(pausa)
      pare

    }

    }

    escreva("===Obrigado por usar nosso sistema :)===")

    }
    senao 
    {
      //programa encerrado 
      escreva ("Programa encerrado")
    }
    
  }
}
