
if (movendo_para_cima) {
    y -= velocidade_subida;

    if (y <= pos_y_final) {
        y = pos_y_final;
        movendo_para_cima = false;
        animando_escala = true;
    }
}

if (animando_escala) {
    // velocidade do chin chun
    pos_curva += 0.015;

    escala = animcurve_channel_evaluate(curva, pos_curva);

    image_xscale = escala;
    image_yscale = escala;
	
    if (pos_curva > 1) {
        animando_escala = false;
    }
}
