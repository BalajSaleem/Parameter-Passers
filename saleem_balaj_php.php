<?php
//class objects passed by reference
class Tester {
    public $testVar=0;
}
//functions can be passed as parameters. This is used in fun5
function cuber($i){
   return $i*$i*$i;
}
//simple positional parameter correspondense
function fun1( $a,  $b,  $c){
   echo("---FUN1---\n");
   echo("a is: $a ");
   echo("b is: $b ");
   echo("c is: $c \n"); 
}
//default values can be assigned, but they must be last
function fun2( $a,  $b=99,  $c=99 ){
   echo("---FUN2---\n");
   echo("a is: $a ");
   echo("b is: $b ");
   echo("c is: $c \n"); 
}
//variable number of parameters can be provided
function fun3(){
   echo("---FUN3---\n");
   $totalArg = func_num_args();
   $arg_list = func_get_args();
   echo("total parameters provided: $totalArg \n");
   for ($i = 0; $i < $totalArg ; $i++) {
       echo("$arg_list[$i] ");
   }
   echo("\n");   
}
//test for passing methods, a passed by value, b passed by reference 
//array is also passed by reference(by choice), objects always passed by reference
function fun4( $a, &$b, &$array, $obj){
   echo("---FUN4--- \n");
   $a = $a*$a;
   $b = $b*$b;
   array_push($array,"99");
   $obj->testVar = 9999;
   $value = $obj->testVar;
   echo("a inside: $a ");
   echo("b inside: $b \n");
   echo("object inside: $value \n");
   echo("array inside: ");    
   foreach($array as $item){ echo("$item "); } echo("\n");

}
//functions can be passed as arguments in php
function fun5($f, $i){
   echo("---FUN5---\n");
   echo($f($i));
   echo("\n");
}
//rest parameter(must be last formal parameters)
function fun6($a,$b, ...$others){
   echo("---FUN6---\n");
   echo("a is: $a ");
   echo("b is: $b \n");
   echo("rest of the parameters: ");
   foreach($others as $item){
   echo("$item ");   
   }
   echo("\n");
}

fun1(1,2,3); //simple positional correspondence
//fun1(1,2,3,4); //also works, 4 is available in $arg_list(tested ahead)
//fun1(1); //error, not enough arguments provided

fun2(1); //default value for b and c used
fun2(1,2,3); //works, arguments possistionally assisgned
//fun2($a=1,$c=2,$b=3); //does not work as expeced, still uses positional correspondence

fun3(1,2,3,4,5,6);//variable number of arguments passed
//fun3(1,2,3,4,5,6,7,8,9,10) //also works
//
//declaring different data types to check their values after a function, i.e whether the function uses, in , out , or inout methods   
$a = 3;
$b = 5;
$array = [0,0,0];
$obj = new Tester();
$value = $obj->testVar;
echo("----------\n");  
echo("initial a: $a ");
echo("initial b: $b \n"); 
echo("initial object: $value \n");    
echo("initial array:");   
foreach($array as $item){ echo("$item "); } echo("\n");

fun4($a,$b,$array,$obj);

echo("----------\n"); 
$value = $obj->testVar;
echo("a after: $a ");
echo("b after: $b \n");
echo("object after: $value\n"); 
echo("array after:");    
foreach($array as $item){ echo("$item "); } echo("\n");
 
fun5('cuber', 2);

fun6(1,2, 99,99,99,99,99); //mixed positional and variable number of arguments  
?>
