struct A { x: Int }
struct B { y: Bool }
struct C { z: String}

contract MultiStructs {
 a: A;
 b: B;
 c: C;

 init(){
   self.a = A{x:1};
   self.b = B{y:true};
   self.c = C{z:"q"};
 }
}