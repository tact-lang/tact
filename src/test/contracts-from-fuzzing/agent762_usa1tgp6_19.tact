struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Int;
}

struct Comb {
  i1: Inner1;
  i2: Inner2;
}

contract StructWithTwoInnerStructs {
  c: Comb;

  init() {
    self.c = Comb {
      i1: Inner1 { a: 5 },
      i2: Inner2 { b: 7 }
    };
  }
}