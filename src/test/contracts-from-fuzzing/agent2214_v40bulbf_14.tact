struct A {
 x: Int;
}

struct B {
 y: Int;
}

struct C {
 z: Int;
}

struct D {
 a: A;
 b: B;
 c: C;
}

contract MultiNestedDiff {
 data: D;

 init() {
   self.data = D{
     a: A{x:1},
     b: B{y:2},
     c: C{z:3},
   };
 }
}