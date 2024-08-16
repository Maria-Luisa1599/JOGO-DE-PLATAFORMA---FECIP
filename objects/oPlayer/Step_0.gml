#region CONTROLES
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check_pressed(vk_space);
#endregion

#region SPRITE MOVIMENTAÇÃO
// Definição da Velocidade Horizontal
var move = direita - esquerda;
hveloc = move * veloc;

// Definição dos Sprites com Base na Direção
if (hveloc > 0) {
    sprite_index = sPlayerCorreD;  // Movendo para a direita
} else if (hveloc < 0) {
    sprite_index = sPlayerCorreE;  // Movendo para a esquerda
} else {
    sprite_index = sPlayer;  // Parado
}

#endregion

#region COLISÃO H E V
// Detecção e Resolução de Colisão Horizontal
if (place_meeting(x + hveloc, y, oChao) or place_meeting(x + hveloc, y, oPlataforma) or place_meeting(x + hveloc, y, oChaoMenor)) {
    while (!place_meeting(x + sign(hveloc), y, oChao) and !place_meeting(x + sign(hveloc), y, oPlataforma) and !place_meeting(x + sign(hveloc), y, oChaoMenor)) {
        x += sign(hveloc);
    }
    hveloc = 0;
}

// Aplica Movimento Horizontal
x += hveloc;

#region PULO
// Gravidade e Pulo
if (!place_meeting(x, y + 1, oChao) and !place_meeting(x, y + 1, oPlataforma) and !place_meeting(x, y + 1, oChaoMenor)) {
    vveloc += gravidade;  // Aplica gravidade se não estiver no chão
} else {
    if (cima) {
        vveloc = -4.8;  // Define a velocidade vertical para o pulo
    } else {
        vveloc = 0;  // Zera a velocidade vertical ao tocar o chão
    }
}
#endregion

// Detecção e Resolução de Colisão Vertical
if (place_meeting(x, y + vveloc, oChao) or place_meeting(x, y + vveloc, oPlataforma) or place_meeting(x, y + vveloc, oChaoMenor)) {
    while (!place_meeting(x, y + sign(vveloc), oChao) and !place_meeting(x, y + sign(vveloc), oPlataforma) and !place_meeting(x, y + sign(vveloc), oChaoMenor)) {
        y += sign(vveloc);
    }
    vveloc = 0;
}

// Aplica Movimento Vertical
y += vveloc;
#endregion

#region CAIXA


if (keyboard_check_pressed(vk_control)) {
	
	//distancia pra quebrar a caixa rs
    var max_distance = 50;
    var caixa = instance_nearest(x, y, oCaixa);
    if (caixa != noone && point_distance(x, y, caixa.x, caixa.y) <= max_distance) {
        //caixa explosão
        caixa.sprite_index = sCaixaExplode;
        caixa.image_index = 0;
        // reproduz só uma vez
        caixa.image_speed = 1;
		
        caixa.exploding = true;
    }
}
#endregion

// Reinicia se a tecla R for pressionada
if (keyboard_check(ord("R"))) {
    room_restart();
}
#endregion