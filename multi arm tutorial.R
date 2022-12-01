install.packages('MAMS')
library(MAMS)


#Create the 4 arm single stage design.
onestage=mams(K=3, J=1, alpha=0.05, 
              power=0.9, r=1, r0=1,
              p=NULL, p0=NULL,
              delta=0.44, delta0=0.18, 
              sd=0.9)


summary(onestage)
perARM=ceiling(onestage$n*1.15)
finalN=4*perARM

print(perARM)
print(finalN)


#Twostage 4 arm two stage design with 1:2 allocation ratios
twostage=mams(K=4, J=2, alpha=0.05, 
              power=0.98, r=1:2, r0=1:2, 
              delta=0.42, delta0=0.18, p=NULL, p0=NULL,
              sd=0.9)


summary(twostage)
perARM2=ceiling(twostage$n*1.15)
finalN2=4*perARM2

print(perARM2)
print(finalN2)


#Install multiarm package
install.packages("devtools")
devtools::install_github("mjg211/multiarm")


#multiarm library - load
library(multiarm)



#Conjunctive multiarm design with Dunnett's correction
mcdesignD <- des_ss_norm(K = 6,
                          alpha = 0.05,
                          beta = 0.1,
                          delta1 = 0.44,
                          delta0 = 0.18,
                          sigma = c(0.9,0.9,0.9,0.9,0.9,0.9,0.9),
                          ratio = c(1,1,1,1,1,1),
                          correction ="dunnett",
                          power = "conjunctive",
                          integer = TRUE)



perARM3=ceiling(mcdesignD$n*1.15)
finalN3=7*perARM3
print(perARM3)
print(finalN3)






#Conjunctive multiarm design with Bonferroni correction
mcdesignD2 <- des_ss_norm(K = 6,
                         alpha = 0.05,
                         beta = 0.1,
                         delta1 = 0.44,
                         delta0 = 0.18,
                         sigma = c(0.9,0.9,0.9,0.9,0.9,0.9,0.9),
                         ratio = c(1,1,1,1,1,1),
                         correction ="bonferroni",
                         power = "conjunctive",
                         integer = TRUE)



perARM4=ceiling(mcdesignD2$n*1.15)
finalN4=7*perARM4
print(perARM4)
print(finalN4)



