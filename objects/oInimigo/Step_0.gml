
//batendo na parede
if place_meeting(x, y, oPlataforma){
 if direc == 0{
	 direc = 1;
 }else if direc == 1{
	  direc = 0;
 }
}

 //andando para a direita
if direc == 0{
	sprite_index = sInimigo
	x += global.veloc;
}//andando para a esquerda
else if direc == 1{
	sprite_index = sInimigo
	x -= global.veloc;
}
//gravidade 
// Aplicar gravidade
if (!place_meeting(x,y + 5,oChao)) {
    velocidade_vertical += gravidade; // Aumenta a velocidade de queda
    if (velocidade_vertical > velocidade_maxima) {
        velocidade_vertical = velocidade_maxima; // Limita a velocidade de queda
    }
} else {
    velocidade_vertical = 0; // Reseta a velocidade vertical se estiver no chão
}
// Aplicar movimento vertical (queda)
y += velocidade_vertical;

// Verifica se a vida do inimigo chegou a zero
if (vida <= 0) {
	instance_destroy();
}



#region INVENCIBILIDADE
tempo_invencivel += 1;
if (tempo_invencivel <= tempo_maximo_invencivel) {
	if(keyboard_check(ord("4")) && !invencivel = true){
		vida = 9999999;
		invencivel = true;
	}
}else{
	vida = 10;
}
#endregion

