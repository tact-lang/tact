struct DeepNested {
  x: Int;
  y: Bool?;
}

struct Outer {
  nested: DeepNested;
  flag: Bool;
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{
      nested: DeepNested{x: 5, y: null},
      flag: true
    };
  }
}
