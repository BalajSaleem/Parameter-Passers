//only optional parameters can have default values, if no default value is assigned, it is null 
//classes passed by reference
class Tester{
   int testNumber = 0;
}
//functions can be passed as parameters. This is used in fun5
cuber(int i){
   return i*i*i;
}
//simple positional parameter correspondense
//fun1(int a=1, int b=2, int c=3){ //error since non optional variables can not have default values
fun1(int a, int b, int c){
   print("---FUN1---");
   print("a is: $a b is: $b c is: $c");
}
//[]allows for optional parameters can not be accessed by name, 
//positional parameters can not be added after this
fun2(int a, [int b, int c = 3] ){
   print("---FUN2---");
   print("a is: $a b is: $b c is: $c");
}
//variable lenght arguments not possible
//{} allows for optional parameters that must be addressed by name, 
//however positional parameters can not be added after this 
fun3(int a, {int b = 2, int c = 3} ){
   print("---FUN3---");   
   print("a is: $a b is: $b c is: $c");
}
//test for passing methods, only in mode - pass by value - possible for primitive types, 
//objects are passed by reference - in out mode -
//fomral variables DO NOT need to have types
fun4( a, array, obj){
   print("---FUN4---");
   a = a*a;
   //array += [99,99,99]; //does not affect the orignial array
   array.add(99);
   obj.testNumber = 9999;
   print("a inside fun4: $a");
   print("array inside fun4: $array");
   print("object inside fun4: ${obj.testNumber}");
}
//functions can be passed as arguments in dart
fun5(f, i){
   print("---FUN5---");
   print(f(i));
}
void main() {	
   
   fun1(1,2,3); //simple positional correspondence
   //fun1(a=1,c=2,d=3); error, cannot address variables by names unless these variables are enclosed by {}

   fun2(1);
   fun2(1,99); // b and c are optional, here only b is provided
   //fun2() //error since the first argument is needed, it is not optional
   //fun2(1, b:99); //error since the variables are optional but not name addressable by {}

   
   fun3(1, c:99 ); //addresses the variable c by name, but a by position, since b is optional and not provided, it is null
   fun3(1); //WORKS, as the parameters b,c are optional, just as demonstrated above with "fun2(1);"
   //fun3(1,2,3); //error, the parameters enclosed by {} can not be provided positionally
   //fun3(1, d:99); //error, since no parameter with name d exists
   //check if the it is pass by value/or pass by result(which should give error, since a is not declared)
   
   //declaring different data types to check their values after a function, i.e whether the function uses, in , out , or inout methods   
   int a = 3;
   var array = [0,0,0];
   Tester obj = new Tester();
   print("----------");   
   print("a before fun4: $a");
   print("array before fun4: $array");
   print("object variable before fun4: ${obj.testNumber}");   
   fun4(a,array,obj);
   print("a after fun4: $a");
   print("array after fun4: $array");
   print("object variable after fun4: ${obj.testNumber}");
   
   fun5(cuber, 2); //passing a function(cuber) to another function as a parameter
}
