struct Inner2 { s: String }

contract NullableStringStruct {
  s: Inner2?;

  init() {
    self.s = null;
  }
}
