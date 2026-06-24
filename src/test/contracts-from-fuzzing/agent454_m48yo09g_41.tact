struct A { v:Int }
struct B { v:Int }

struct C {
  sa: A;
  sb: B;
}

contract MixedStructs {
  c:C;
  init() {
    self.c = C{ sa:A{v:1}, sb:B{v:2} };
  }
}