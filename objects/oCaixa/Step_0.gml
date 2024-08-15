// Verifique se a caixa está em estado de explosão
if (exploding) {
    // Verifique se a animação terminou
    if (image_index >= image_number - 1) {
        // Destrua a instância da caixa
        instance_destroy();
    }
}
