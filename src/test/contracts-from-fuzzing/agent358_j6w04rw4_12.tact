struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct ManyNested {
  a: A;
  b: B;
  flag: Bool;
  txt: String;
  opt: Int?;
}

contract NestedInPersistent {
  data: ManyNested;

  init() {
    self.data = ManyNested{
      a: A{ x: 3 },
      b: B{ y: 4 },
      flag: true,
      txt: "hi",
      opt: null,
    };
  }
}