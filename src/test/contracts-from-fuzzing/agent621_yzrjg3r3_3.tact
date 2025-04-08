struct OptLayer {
  optionalStruct: Inner?;
}

struct Inner {
  flag: Bool;
  val: Int?;
}

contract Test {
  state: OptLayer;

  init() {
    self.state = OptLayer{
      optionalStruct: null,
    };
  }
}
