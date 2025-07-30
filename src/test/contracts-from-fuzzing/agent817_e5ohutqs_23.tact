struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Int;
}

struct Combined {
  i1: Inner1;
  i2: Inner2;
}

contract Test {
    combined: Combined;

    init() {
      self.combined = Combined{
        i1: Inner1{ a: 3 },
        i2: Inner2{ b: 4 }
      };
    }
}