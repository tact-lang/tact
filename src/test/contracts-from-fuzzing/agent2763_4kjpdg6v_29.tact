struct HasBool {
  flag: Bool;
}

struct WrapperBool {
  val: HasBool;
}

contract BoolFieldNested {
  data: WrapperBool;

  init() {
    self.data = WrapperBool{ val: HasBool{ flag: true } };
  }
}