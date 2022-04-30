library(aRtsy)

set.seed(314)

png(file = "experimental.png", width = 800, height = 700)

canvas_petri(colors = colorPalette("tuscany1"), background = "white", hole = .314)

dev.off()

library(magick)
library(magrittr) 

# Call back the plot
plot <- image_read("experimental.png")
plot2<-image_annotate(plot, "JaguaRt", 
                      color = "gray", size = 50,
                      location = "10+50", gravity = "north")
plot3<-image_annotate(plot2, "Visualization by @fblpalmeira
                      Image credit: @fblpalmeira", 
                      color = "gray", size = 15, 
                      location = "10+50", gravity = "southeast")
# And bring in a logo
i1 <- image_read("https://raw.githubusercontent.com/fblpalmeira/aRtsy/main/data/cabeca_onca2.png") 
out1<-image_composite(plot3,image_scale(i1,"x100"), offset = "+350+300")

image_browse(out1)

# And overwrite the plot without a logo
image_write(out1, "experimental2.png")

citation(package="aRtsy")
