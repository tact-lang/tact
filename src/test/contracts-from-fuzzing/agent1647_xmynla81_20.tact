message(9) OpMsg {
  code: Int;
}

struct NestedOpt {
  inside: OpMsg?;
  flag: Bool?;
}

contract Test {
  data: NestedOpt;

  init() {
    self.data = NestedOpt{
      inside: OpMsg{code: 99},
      flag: true
    };
  }
}
