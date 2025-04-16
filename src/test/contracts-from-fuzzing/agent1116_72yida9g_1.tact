struct DeepNested {
  level3: Innermost?;
}

struct Innermost {
  val: Int?;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{ level3: Innermost{ val: 42 } };
  }
}
