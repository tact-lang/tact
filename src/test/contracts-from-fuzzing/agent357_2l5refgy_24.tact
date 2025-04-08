struct OptionalStruct {
  s: Sub?;
}

struct Sub {
  val: Int;
}

contract OptionalStructContract {
  val: OptionalStruct;

  init() {
    self.val = OptionalStruct{ s: null };
  }
}