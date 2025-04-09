struct TwoLevel {
  s1: String;
  n1: Int;
}

struct ThreeLevel {
  s0: String;
  nested: TwoLevel;
  n2: Int;
}

contract NestedLevelContract {
  data: ThreeLevel;

  init() {
    self.data = ThreeLevel{
      s0: "outer",
      nested: TwoLevel{ s1: "inner", n1: 321 },
      n2: 555
    };
  }

  receive() {
    let _ = self.data;
  }
}