struct OptionalDefaultInner {
  foo: Int? = null;
}

contract OptionalDefaultStruct {
  val: OptionalDefaultInner;

  init() {
    self.val = OptionalDefaultInner{};
  }
}
