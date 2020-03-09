


class Tester:
   testNumber = 0

#functions can be passed as parameters. This is used in fun5
def cuber(i):
   return i*i*i

#simple positional parameter correspondense
def fun1(a, b, c):
   print("---FUN1---")
   print("a is:" , a , "b is:" , b , "c is:" , c)

#def fun2(a, b=3, c ): #error, non defualt argument cannot follow default one
def fun2(a, b=2, c=3 ):
   print("---FUN2---")
   print("a is:" , a , "b is:" , b , "c is:" , c)
#variable lenght of provided parameters, * for list and ** for dictionary, 
#other arguments can not follow lists/dictionaries
def fun3(a, *b, **c):
   print("---FUN3---")   
   print("a is:" , a , "b is:" , b , "c is:" , c)




#pass by assignment, all immutables changed, unless new ones are declared
def fun4(a, array, obj):
   print("---FUN4---")
   a = a*a
   array += [99,99,99]
   #array = [99,99,99] #will not change the list, instead it will create a new one, the outer instance of array will not be affected
   obj.testNumber = 9999
   print("a inside fun4: " , a)
   print("array inside fun4: " , array)
   print("object variable inside fun4: " , obj.testNumber)

#functions can be passed as arguments in python
def fun5(f, i):
   print("---FUN5---")
   print(f(i))

fun1(1,2,3) #simple positional correspondence
fun1(a=1,c=3,b=2) #works, since all required parameters are given, however if any of the three are missing we get an error
#fun1(a=1,b=2,c=2,d=3) #error, d is not declared as a formal parameter
#fun1(a=1,b=2) #error, c is not provided as an argument, and it does not have a default value

fun2(a=1, c=99)
fun2(1, c=999, b=99) # b and c are optional, can be provided in any order
fun2(1,2,3) #works since varibles have positional corespondence
#fun2(a=1, b=99, 99) #error, can not have positional corespondence after name corespondence
#fun2() #error since the first argument is needed, it is not optional
#fun2(1, b=99, 3) #error since the variables are optional but not name addressable by :
 
fun3(1, 2,3,4,5, c=99,d=999,f=9999) #takes a single parameter, a list and a dictionary(key-value pairs)

#declaring different data types to check their values after a function, i.e whether the function uses, in , out , or inout methods 
a = 3
array = [0,0,0]
obj =  Tester
print("----------") 
print("a before fun4: " , a)
print("array before fun4: " , array)
print("object variable before after fun4: " , obj.testNumber)
fun4(a,array,obj)
print("a after fun4: " , a)
print("array after fun4: " , array)
print("object variable after fun4: " , obj.testNumber)

fun5(cuber, 2) #passing a function(cuber) to another function as a parameter
