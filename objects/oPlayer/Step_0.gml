#region CONTROLES
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);
#endregion

#region MOVIMENTAÇÃO

// movimento horizontal
var move = key_right - key_left;
hspd = move * spd;

if (hspd != 0) {
    image_xscale = sign(hspd); // Inverte a imagem
}
x += hspd;

// Colisão horizontal com o chão e a plataforma
if (place_meeting(x, y, oChao) or place_meeting(x, y, oPlataforma) or place_meeting(x, y, oChaoMenor)) {
    while (!place_meeting(x + sign(hspd), y, oChao) /*and !place_meeting(x + sign(hspd), y, oPlataforma)*/ and !place_meeting(x + sign(hspd), y, oChaoMenor)) {
        x += sign(hspd);
    }
    hspd = 0;
	
	// aparentemente n ta funcionandoa colisão horizontal (pedro, se vc ler isso, dps eu te mando como fiz)
}

// Atualiza a gravidade
vspd += grv;

// Colisão vertical com o chão e a plataforma
if (place_meeting(x, y + vspd, oChao) or place_meeting(x, y + vspd, oPlataforma) or place_meeting(x, y + vspd, oChaoMenor)) {
    while (!place_meeting(x, y + sign(vspd), oChao) and !place_meeting(x, y + sign(vspd), oPlataforma) and !place_meeting(x, y + sign(vspd), oChaoMenor)) {
        y += sign(vspd);
    }
    vspd = 0;
}

// posição vert
y += vspd;

// Pulo
if (place_meeting(x, y + 1, oChao) or place_meeting(x, y + 1, oPlataforma) or place_meeting(x, y + 1, oChaoMenor)) {
    if (key_jump) {
        vspd -= 8;
    }
}

#endregion

#region ALTERANDO SPRITE
// sprite correndinho
if (key_right or key_left) {
    sprite_index = sPlayerCorre;
} else if (vspd < 0) {
    sprite_index = sPlayerPula;
} else {
    sprite_index = sPlayer;
}
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
