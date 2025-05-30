struct OptStruct {
  f: Int?;
}

contract NullableFieldStruct {
  a: OptStruct?;
  val: Int;

  init() {
    self.a = OptStruct { f: null };
    self.val = 420;
  }
}
