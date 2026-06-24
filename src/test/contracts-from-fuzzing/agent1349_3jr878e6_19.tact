struct A {
  x: Int;
  y: Int;
}

struct B {
  a: A;
  n: Int?;
}

struct C {
  b: B;
  m: Bool?;
}

contract DeepOptional {
  storage: C = C{
    b: B{
      a: A{ x:1, y:2 },
      n: null
    },
    m: null
  };

  receive() {
    self.storage = self.storage;
  }
}