# $description: Exportar modelos de simulación
# $version: 0.1
# $show-in-menu
module GenerateModels
 
  include RBA

  def self.create_rtd_lib(sheet_rho, output_dir)
    lib_path = File.join(output_dir, "cidesi_tfs20_models.lib")
    
    File.open(lib_path, "w") do |f|
      f.puts "* Librería de modelos para proceso CIDESI_TFS20"      
      f.puts "* Autor: Rodolfo Sanchez Fraga"
      f.puts "* Gerencia de Semiconductores y Microtecnologías, CIDESI"
      f.puts "* Modelo resistor con efecto de temperatura, Resistencia por cuadro: #{sheet_rho} Ω/□"
      f.puts ".model RTFS20 RES(TC1=0.00293)"
      f.puts ".include netlist.cir"
    end
    
    puts "Archivo .lib generado en: #{lib_path}"
    lib_path
  rescue => e
    puts "Error al crear .lib: #{e.message}"
    nil
  end
  
end
