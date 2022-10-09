u = 2; la = 1; m = 7; theta = 0.1;
c = (1+theta)*la*m; n = 10000; nSim = 100;
N = rep(Inf, nSim) ##Initialisation of ruin indicators
Y = rep(0, nSim)##Initialisation of aggregated loss
set.seed(2);
for (k in 1:nSim){
  W = rexp(n)/la; T = cumsum(W)
  X = rexp(n) *m ## claims of mean EC=13
  S = cumsum(X); U = u + T*c - S
  ruin = !all(U>=0) #ruin=non-survival
  if (ruin) {N[k] = min(which(U<0));Y[k]=-U[N[k]];V=U}
}
#N are the indicators of ruin
Nf = N[N<Inf];#select the True values
length(Nf); mean(Nf); sd(Nf); max(Nf);
## 34 31.2 22.5 119
Yf = Y[Y>0];mean(Yf)

x11()
par(bg='lightblue') #plot background color
plot(V,type='l',main='probabilite de ruine (Cramer-Lundberg(Exp))', col='white',lwd=3, xlab='temps')
abline(h=0,col='red',lty=2,lwd=3)