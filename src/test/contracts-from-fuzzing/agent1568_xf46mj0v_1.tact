struct DeepNested {
  x: Int;
  flag: Bool;
}

struct Outer {
  dn: DeepNested;
  s: String;
  optInt: Int?;
}

contract TestContract {
  param: Outer;

  init() {
    self.param = Outer{
      dn: DeepNested{
        x: 42,
        flag: false,
      },
      s: "world",
      optInt: null,
    };
  }
}