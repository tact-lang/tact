struct DeepNested {
  z: Int;
  flag: Bool;
}

struct Middle {
  nested: DeepNested;
  amount: Int;
}

struct Outer {
  mid: Middle;
  active: Bool;
}

contract TestDeep {
  storage: Outer;

  init() {
    self.storage = Outer{
      mid: Middle{
        nested: DeepNested{
          z: 123,
          flag: false
        },
        amount: 321
      },
      active: true
    };
  }
}
