struct Inner {
  val: Int?;
  flag: Bool;
}

contract OptionalStruct {
  store: Inner?;
  init() {
    self.store = null;
  }
}