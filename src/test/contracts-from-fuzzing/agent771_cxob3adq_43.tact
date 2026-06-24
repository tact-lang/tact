struct Inner { v: Int; }
contract NullDefaultStruct {
  field: Inner? = null;

  init() {
    self.field = Inner{ v: 42 };
  }
}