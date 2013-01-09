#include<stdio.h>
#include<math.h>

double newt(int n, int k){
if (k==0) return 1;
else
if(n<k) return 0;
else
return newt(n-1,k) + newt(n-1,k-1);
}

double pr(int n, int k, double p){
if (n==0 || k==0 || n<k) return 0;
else return (newt(n,k)*pow(p,k)*pow(1-p,n-k));
}

double cumulative(int n,int k, int p) {
  int i,j;
	for(i=0; i<=k;i++) {
   j= j+pr(n,i,p);}
   return j;
}	
double hoeffding(int n, int k, double p){
	return 0.5*exp((-2)*pow(n*p-k,2)/n);
}	

int main(){
	
int n,k;
double p, wynik, wynik2;
printf("Liczba rzutów. n: \n");
scanf("%d", &n);
printf("Liczba sukcesów. k:\n");
scanf("%d", &k);
printf("Pradopodobienstwo wyrzucenia orła p:\n");
scanf("%lf", &p);
wynik=cumulative(n,k,p);
printf("prawdopodobieństwo wynosi: %lf \n", wynik);
wynik2=hoeffding(n,k,p);
printf("ograniczenie górne Hoeffdinga wynosi: %lf \n", wynik2);
}
