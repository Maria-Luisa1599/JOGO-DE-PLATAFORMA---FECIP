pos_y_inicial = y;
pos_y_final = pos_y_inicial - 300; //o tanto q sobe
velocidade_subida = 5.5; // a velocidade dos subida
movendo_para_cima = true;

//animação fodastica que faz chinn e depois chunnn
curva = animcurve_get_channel(ac_teste, "escala");
pos_curva = 0;
animando_escala = false;