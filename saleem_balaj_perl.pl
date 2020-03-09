#parameter list is passed to functions in $_
sub fun1{
   print("---FUN1---\n");
   print("arguments passed: \n");
   foreach $item(@_){ #all actual parameters available in $_
      print("$item ");
   }
   print("\n");
   
}
#all variables are passed by reference(inout), also called passed by alias
sub fun2{
   print("---FUN2---\n");
   foreach $item(@_){
      $item++;
   }
   print("a in fun2: $_[0]      "); #first parameter passed is called a, it is first in param list
   print("b in fun2: $_[1]\n"); #second one is b
}
#variables can be simulated to be passed by value(in)
sub fun3{
   print("---FUN3---\n");
   my $a = shift; #shift can be used to shift the argument array pointer ahead
   my $b = shift;
   $a++;
   $b++;
   print("a in fun3: $a      "); #first parameter passed is called a, it is first in param list
   print("b in fun3: $b\n"); #second one is b
}
#no INBUILT mechanism to set default values \\ no formal parameters 
#no INBUILT mechanism to assign actual parameters by name
fun1(1,2);         #simple positional correspondence
fun1(1,2,3,4,5,6); #variable number of actual parameters 
my $a = 0;
my $b = 1;
print("------\n");
print("a before fun2: $a  ");
print("b before fun2: $b\n");
fun2($a,$b);
print("------\n");
print("a after fun2: $a   ");
print("b after fun2: $b\n");
print("------\n");
print("a before fun3: $a  ");
print("b before fun3: $b\n");
fun3($a,$b);
print("------\n");
print("a after fun3: $a   ");
print("b after fun3: $b\n");
