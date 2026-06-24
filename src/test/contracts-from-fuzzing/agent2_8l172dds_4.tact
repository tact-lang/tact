struct DeepInner {
  flag: Bool;
  note: String;
}

struct DeepMiddle {
  nested: DeepInner;
  num: Int;
}

struct DeepOuter {
  another: Int;
  middle: DeepMiddle;
}

contract Test {
  complex: DeepOuter;

  init() {
    self.complex = DeepOuter{
      another: 99,
      middle: DeepMiddle{
        nested: DeepInner{
          flag: true,
          note: "check"
        },
        num: 42
      }
    };
  }
}