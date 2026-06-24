struct A {
 a: Int; 
}

struct B {
 b: Int;
}

struct C {
  one: A;
  two: B;
}

contract BigNested {
  data: C;

  init() {
    self.data = C {
      one: A{ a:1 },
      two: B{ b:2 }
    };
  }
}