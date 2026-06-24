struct A {
  i: Int;
}

struct B {
  j: Int;
}

struct Combined {
  a: A;
  b: B;
  c: Bool;
  d: Int?;
}

contract ComboDeep {
  data: Combined;

  init() {
    self.data = Combined {
      a: A{i:1},
      b: B{j:2},
      c: true,
      d: null
    };
  }
}