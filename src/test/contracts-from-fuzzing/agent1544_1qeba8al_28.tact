struct OptionalBoolStruct {
  flag: Bool?;
}

contract OptBoolStructInit {
  val: OptionalBoolStruct;

  init() {
    self.val = OptionalBoolStruct{ flag: null };
  }
}
