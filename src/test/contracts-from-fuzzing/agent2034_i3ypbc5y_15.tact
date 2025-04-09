struct A {
 x: Int;
 y: Int;
}

struct B {
 x: Int;
 y: Int;
}

struct BigStruct {
 a: A;
 b: B;
}

contract StructMult {
 v: BigStruct;

 init() {
   self.v = BigStruct{
     a: A{ x:1, y:2 },
     b: B{ x:3, y:4 }
   };
 }
}