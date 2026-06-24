struct X {
  a: Int;
}

struct Y {
  b: X;
}

struct Z {
  c: Y;
}

contract Test {
  nested: Z;

  init() {
    self.nested = Z{
      c: Y{
        b: X{
          a: 321,
        },
      },
    };
  }
}
