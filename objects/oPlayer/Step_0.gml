direita = keyboard_check(ord("D"))
	esquerda =  keyboard_check(ord("A"))
	cima = keyboard_check_pressed(vk_space)

	hveloc = (direita - esquerda) * veloc
	if direita
	{ 
		direc = 0
		sprite_index = sPlayerCorreD
	}else if esquerda
	{
		direc = 1
		sprite_index = sPlayerCorreE
	}else
	{
		sprite_index = sPlayer
	}
	//movimentação e colisão
	if !place_meeting(x, y + 1, oChao)
	{
		vveloc += gravidade
	}else
	{
		if cima
		{
			vveloc = -4.8
		}
	}
	if place_meeting(x + hveloc, y, oChao)
	{
		while !place_meeting(x + sign(hveloc), y, oChao)
		{
			x += sign(hveloc)
		}
	
		hveloc = 0 
	}

	if place_meeting(x, y  + vveloc, oChao)
	{
		while !place_meeting(x , y + sign(vveloc), oChao)
		{
			y += sign(vveloc)
		}
	
		vveloc = 0 
	}

	x += hveloc
	y += vveloc
	
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
