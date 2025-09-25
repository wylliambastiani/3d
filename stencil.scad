font_name = "Saiyan Sans:style=Regular";  

difference() {
    // base (placa)
    cube([150, 20, 2], center = true);    

    // texto extrudado, que será "cortado" da placa
    translate([0, 0, -5])  // empurra um pouquinho para baixo p/ garantir corte completo
        linear_extrude(height = 30)  // altura da extrusão do texto
            text("Dragon Ball Z  O", 
                 font   = font_name, 
                 size   = 10,        // tamanho do texto (ajuste conforme necessário)
                 halign = "center", 
                 valign = "center");
}
