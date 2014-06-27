int matrix_size = 7;

void setup()
{
  size(500, 650);
  int L=50;
  background(255);
  noStroke();
  
  int[][] jogos={
  {1, 7}, {6, 3}, {9, 13}, {14, 10},
  {19, 24}, {21, 17}, {25, 30}, {29, 28}
  };
  int[][] jogos_old={{1, 2}, {1, 3}, {1, 4}, {2, 3}, 
  {2, 4}, {3, 4}, {5, 6}, {5, 7}, 
  {5, 8}, {6, 7}, {6, 8}, {7, 8},  
  {9, 10}, {9, 11}, {9, 12}, {10, 11}, 
  {10, 12}, {11, 12}, {13, 14}, {13, 15},  
  {13, 16}, {14, 15}, {14, 16}, {15, 16}, 
  {17, 18}, {17, 19}, {17, 20}, {18, 19}, 
  {18, 20}, {19, 20}, {21, 22}, {21, 23}, 
  {21, 24}, {22, 23}, {22, 24}, {23, 24}, 
  {25, 26}, {25, 27}, {25, 28}, {26, 27}, 
  {26, 28}, {27, 28}, {29, 30}, {29, 31}, 
  {29, 32}, {30, 31}, {30, 32}, {31, 32}
};
  
 for (int i=0; i<48; i++) {
 criarimagem(jogos[i][0], jogos[i][1]);
 }
}

float[][] prob(int t1, int t2){
  float[] alfa={
3.8586049,
2.0259384,
2.3275381,
1.4375509,
3.3112916,
3.1215319,
2.9272261,
2.1401488,
3.0525655,
1.2662680,
2.6324061,
2.2719974,
2.9160197,
1.6770772,
2.1280993,
2.3542412,
2.2713821,
2.1798200,
2.6722294,
1.6142601,
3.4685652,
2.3571350,
1.7049207,
1.9512952,
3.5945397,
2.3783738,
2.0241776,
2.5904816,
2.3419923,
2.0862010,
1.7034527,
1.9312308
  };
  
  float[] beta={
2.9742141,
1.5504115,
2.3123813,
1.1048749,
1.9268741,
2.2294609,
1.9720296,
1.1986898,
2.9805969,
2.0016188,
1.3284245,
1.3672121,
1.7229746,
2.2460636,
1.9260971,
1.4696255,
1.5083562,
1.9932456,
2.5081878,
1.2912083,
2.0730843,
1.6148077,
2.0621070,
1.6352416,
1.9706300,
1.5296888,
1.5356153,
1.8132485,
2.5529239,
1.4369023,
2.3379485,
1.3481480
  };
  float lambda1=alfa[t1-1]/beta[t2-1];
  float lambda2=alfa[t2-1]/beta[t1-1];
  float[] gols1 = {
  exp(-lambda1),
  pow(lambda1, 1)*exp(-lambda1),
  pow(lambda1, 2)*exp(-lambda1)/2,
  pow(lambda1, 3)*exp(-lambda1)/6,
  pow(lambda1, 4)*exp(-lambda1)/24,
  pow(lambda1, 5)*exp(-lambda1)/120,
  pow(lambda1, 6)*exp(-lambda1)/720
  };
  
  float[] gols2 = {
  exp(-lambda2),
  pow(lambda2, 1)*exp(-lambda2),
  pow(lambda2, 2)*exp(-lambda2)/2,
  pow(lambda2, 3)*exp(-lambda2)/6,
  pow(lambda2, 4)*exp(-lambda2)/24,
  pow(lambda2, 5)*exp(-lambda2)/120,
  pow(lambda2, 6)*exp(-lambda2)/720 
};
  
  
  float[][] probs = new float[matrix_size][matrix_size];
  for (int i=0; i<matrix_size; i++){
    for (int j=0; j<matrix_size; j++){
      probs[i][j]=gols1[i]*gols2[j];
    }
  }
  return probs;
}

void criarimagem(int t1,int t2){
  
  int L=50;
  background(255);
  noStroke();
  PFont f;
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  
  //calcula matriz e acha o máximo:
   float[][]  jogo = prob(t1,t2);

  float maximo = 0;
  int imax = 0;
  int jmax = 0;
  float p_empate = 0;
  float p_timeA = 0;
  float p_timeB = 0;
for (int i = 0; i < matrix_size; i++) {
  for (int j = 0; j < matrix_size; j++) {
    if (jogo[i][j]>=maximo){
      maximo = jogo[i][j];
      imax = i;
      jmax = j;
    };
    if (i<j){
      p_timeB = p_timeB + jogo[i][j];
    }
    if(i==j){ 
      p_empate = p_empate + jogo[i][j]; 
    }
    if(i>j) {
      p_timeA = p_timeA + jogo[i][j];
    }
    
   }
}
  
  
  String[] sel={
  "Brasil","Croácia","México","Camarões",
  "Espanha","Holanda","Chile","Austrália",
  "Colômbia","Grécia","Costa do Marfim","Japão",
  "Uruguai","Costa Rica","Inglaterra", "Itália",
  "Suíça","Equador","França", "Honduras",
  "Argentina","Bósnia","Irã","Nigéria",
  "Alemanha","Portugal", "Gana","EUA",
  "Bélgica", "Argélia","Rússia","Coreia do Sul"
  };
 
  String[] bandeiras={ 
  "bra","cro","mex","cmr",
  "esp","ned","chi","aus",
  "col","gre","civ", "jpn",
  "uru","crc","eng", "ita",
  "sui","ecu","fra", "hon",
  "arg","bih","irn","nga",
  "ger","por","gha","usa",
  "bel","alg","rus","kor"
  } ;
  
  //desenha o fundo
  int[][] cor_fundo={
{88, 140, 8},
{56, 89, 7}
  };
  
  fill(cor_fundo[0][0], cor_fundo[0][1], cor_fundo[0][2], 200);
  rect(10,10, width/2-10, height-20);
  
  fill(cor_fundo[1][0], cor_fundo[1][1], cor_fundo[1][2], 200);
  rect(width/2, 10, width/2-10, height-20);
  
  //desenha as bandeiras
   
  PImage sel1 = loadImage("bandeiras/"+bandeiras[t1-1]+".png");
  PImage sel2 = loadImage("bandeiras/"+bandeiras[t2-1]+".png");

  imageMode(CENTER);
  image(sel1, 80, 70, 1.2*70, 1.2*46);  
  
  imageMode(CENTER);
  image(sel2, width-80, 70, 1.2*70, 1.2*46);  
 
  // escreve o resultado
  fill(10);
  textAlign(CENTER);
  textFont(f,16);
  text("Placar mais provável:", width/2, 70-0.6*46);
  textFont(f,46);
  char X = 'x';
  String resultado= str(imax)+" "+ X +" "+ str(jmax);
  text(resultado, width/2, 70+0.6*46);  
  textFont(f,16);
  text("Probabilidade do placar:"+" "+int(round(100*jogo[imax][jmax]))+"%", width/2, 70+2*0.6*46);
  
  //desenha as probabilidades de cada placar
  pushMatrix();
  translate(width/2, 7*height/10);
  rotate(radians(-135));
for (int i = 0; i < 5; i++) {
  for (int j = 0; j < 5; j++) {
    int cor = ceil(170*10*jogo[i][j]);
    //if (cor > maximo) maximo = cor;
    fill(255, 255-cor , 255-cor, 230);
    ellipse(i*L, j*L, L, L);
}
}
  //anota o placar de maior probabilidade 
  noFill();
  strokeWeight(4);
  stroke(60, 20, 150);
  ellipse(imax*L, jmax*L, L, L);

  popMatrix();
  
  println(p_empate+p_timeA+p_timeB);
  strokeWeight(1);
  stroke(240, 240, 255);
  //faz a barra de probabilidades acumuladas
  textFont(f,14);
  fill(200, 200, 230, 230);
  //para garantir que a soma da 1 (erro numerico)
  p_empate = 1-p_timeA-p_timeB;
  int aux_emp = round(map(p_empate, 0, 1, 0, width/2));
  rect(width/2-aux_emp/2, 4*height/5, aux_emp, 30);
  fill(10);
  textAlign(CENTER);
  text(int(round(100*p_empate))+"%", width/2, 4*height/5-6);
  
  fill(170, 170, 255, 230);
  int aux_timeA = round(map(p_timeA, 0, 1, 0, width/2));
  rect(width/2-aux_emp/2-aux_timeA, 4*height/5, aux_timeA, 30);
  fill(10);
  textAlign(LEFT);
  text(int(round(100*p_timeA))+"%", width/2-aux_emp/2-aux_timeA, 4*height/5-6);
  
  
  fill(170, 170, 255, 230);
  int aux_timeB = round(map(p_timeB, 0, 1, 0, width/2));
  rect(width/2+aux_emp/2, 4*height/5, aux_timeB, 30);
  fill(10);
  
  if (aux_timeB<20){
    textAlign(LEFT);
    text(int(round(100*p_timeB))+"%", width/2+aux_emp/2+aux_timeB, 4*height/5-6);
} else {
    textAlign(RIGHT);
    text(int(round(100*p_timeB))+"%", width/2+aux_emp/2+aux_timeB, 4*height/5-6);
};
  
  
    
    // escreve os nomes das selecoes
  textFont(f,25);
  fill(10);
  textAlign(RIGHT);
  text(sel[t1-1],width/2 -10, 9*height/10);
  //textAlign(CENTER);
  //text("X", width/2, 25);
  textAlign(LEFT);
  text(sel[t2-1],width/2 +10, 9*height/10);  

//escreve os creditos da EMAp
textAlign(LEFT);
fill(10);
  textFont(f,10);
  pushMatrix();
  translate(width-2, height-10);
  rotate(radians(-90));
  text("FGV/EMAp - Escola de Matemática Aplicada da FGV", 0, 0);
popMatrix();

//produz a figurinha
String nome_jogo = str(t1)+"_"+str(t2)+"-"+bandeiras[t1-1]+"X"+bandeiras[t2-1]+".png";
saveFrame(nome_jogo);

}

