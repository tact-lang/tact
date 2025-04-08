struct NestedOpt {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

struct Container {
  inner: NestedOpt?;
  other: Int;
}

contract Test {
  state: Container;
  init() {
    self.state = Container{
      inner: NestedOpt{f1: null, f2:true, f3:null},
      other: 42
    };
  }
}
