//variáveis globais;
int[] fib = new int[14]; //lista para determinar o número de elementos da sequência e guardar seu valor;
int fst = 0;            //iniciação do valor "anterior" da sequência;
int snd = 1;           //iniciação do valor "posterior" da sequência;
int counter = 0;      //iniciação do parâmetro para as repetições de operações;
//parâmetros do canvas;
void setup() {
  size(611, 378);         //tamanho do canvas, determinado pela proporção áurea;
  background(255);
  noFill();
  translate(442, 104); //ponto inicial do padrão formado, baseado no tamanho do canvas;
  //sequência de operações;
  while (counter < fib.length) {
    int aux = fst + snd;  //variável que obtém o próximo valor da sequência e auxilia na substituição dos valores "anterior" & "posterior";
    int draw = fst;      //variável que auxilia a "guardar" o valor "anterior" da sequência, antes da substituição. (usado exclusivamente para auxílio do translate);
    fib[counter] = snd; //o valor "posterior" é salvo na lista antes de ser alterado, para visualização da sequência;
    fst = snd;         //a primeira variável ganha o valor de sua sucessora, dando um "passo pra frente" na sequência;
    snd = aux;        //a segunda variável [...];

    rotate(radians(90));     //o canvas é rotacionado em 90º, elementos pré-existentes não são alterados, mas novos elementos são;
    translate(draw, -draw); //alteração do ponto incial de desenho de futuras formas. (Note que é necessário o uso da variável auxiliar "draw" porque, após ser substituída, a variável "fst" tem o atual valor "posterior", que é o parâmetro para os desenhos deste código e será utilizado como valor "anterior" no próximo ciclo da repetição)"

    square(0, 0, fst); //desenho do padrão de quadriláteros;

    scale(1, -1);         //ajuste de escalonamento dos vértices dos arcos. Sem isso os arcos são formados na parte exterior dos quadriláteros, mas este comando quebra o padrão do desenho caso não seja reajustado;
    translate(0, -fst);  //novo ponto inicial de desenho, agora ajustado para desenhar um arco a partir do ponto central de seu círculo;

    arc(0, 0, 2*fst, 2*fst, radians(0), radians(90)); //desenho do padrão dos arcos;

    translate(0, fst); //o ponto incial dos desenhos é novamente alterado para ser feito a partir do vértice dos quadriláteros, ao invés do centro dos cículos dos arcos;
    scale(1, -1);     //reajuste do escalonamento de vertices, para que os quadriláteros voltem a seguir o padrão em espiral;

    counter += 1; //incremento do parâmetro de repetições, para que o padrão seja feito até a décima terceira forma e a lista gravada até seu décimo quarto valor;
  }
  println(fib); //visualização da sequência no terminal;

  //save("fib.png"); //exportação do padrão desenhado. (Caso o código esteja salvo em arquivo);
}
// :)
