install.packages("rmarkdown")
library(rmarkdown)

install.packages('Tmisc')
library(Tmisc)
library(tidyverse)

data(quartet)
View(quartet)

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x),mean(y),sd(y),cor(x,y)) 

ggplot(quartet,aes(x,y))+ geom_point()+ geom_smooth(method=lm, se=FALSE)+facet_wrap(~set)

install.packages("datasauRus")
library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x, y=y, colour =dataset)) + geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3)


 install.packages("SimDesign")
 library(SimDesign)
 
 actual_temp <- c(68.3,70,72.4,71,67,70)
 predicted_temp <- c(67.9,69,71.5,70,67,69)
 bias(actual_temp,predicted_temp)
 #resultt .7166667, close to 1. 
 
 actual_sales <- c(150,203,137,247,116,287)
 predicted_sales <- c(200,300,150,250,150,300)
 bias(actual_sales,predicted_sales)
 #result -35...away from 1 so biased data 
 
 install.packages("ggplot2")
 install.packages("palmerpenguins")
 
 library(ggplot2)
 library(palmerpenguins)
 
 data("penguins")
 View(penguins)
 
# Template 
 
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(mapping = aes(<ASETHTIC MAPPINGS>)) 
 
# Color & shape
 ggplot(data = penguins) + 
   
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species))
 
 
 # Shape
 ggplot(data = penguins) + 
   
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species))
 
 #geom_smooth 
 
 ggplot(data = penguins) + 
   
   geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))
 
 # smooth and jitter and line type 
 ggplot(data = penguins) + 
   geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
   geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype= species))
 
 # Geom Bar - aes -> color fill ->
 ggplot(data= diamonds)+
   geom_bar(mapping = aes(x=cut, fill =clarity))
 
 data %>%
   filter(variable1 == "DS") %>%  
   ggplot(aes(x = weight, y = variable2, colour = variable1)) +  
   geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")
 
 
 
 #facet wrap with scatter plot
 
 ggplot(data = penguins) + 
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
   facet_wrap(~species)
 
 ggplot(data = penguins) + 
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
   facet_wrap(~sex)
 
 # two variables for facet wrap
 # vertically - first variable 
 # horizontally - second variable 
 ggplot(data = penguins) + 
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
   facet_wrap(sex~species)
 
 
 #facet wrap with bar chart 
 ggplot(data=diamonds)+
   geom_bar(mapping=aes(x=color, fill=cut))+
   facet_wrap(~cut)

 #labels
 #display title 
 #display subtitle 
 #display caption
 #display annotate - color , font and size and tilting the text
 ggplot(data = penguins) + 
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
   labs(title = "Palmer Penguins: Body Mass Vs. Flipper Length", subtitle = "Sample of Three Penguins Species",
        caption = "Data Collected by Dr. Kristen Gorman")+
   annotate("text", x=220, y=3500, label="Gentoos are the largest", color ="purple", fontface='bold',size=4.5,angle=25)
 
 
 # since the code is getting bigger, added a variable so its easier to write and add
 p <- ggplot(data = penguins) + 
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
   labs(title = "Palmer Penguins: Body Mass Vs. Flipper Length", subtitle = "Sample of Three Penguins Species",
        caption = "Data Collected by Dr. Kristen Gorman")
 
 # same result as above but shorter code
 p+annotate("text", x=220, y=3500, label="Gentoos are the largest", color ="purple", fontface='bold',size=4.5,angle=25)

# ggsave() - useful for saving a plot, defaults to last used plot 
 ggsave("Three Penguins Species.PNG")
 