struct A {
 a: Int;
}

struct B {
 b: Int;
}

struct C {
 embeddedA: A;
 embeddedB: B;
 s: String;
}

contract CombineAB {
 c: C;
 init() {
   self.c = C{
     embeddedA: A{a: 1},
     embeddedB: B{b: 2},
     s: "str"
   };
 }
}