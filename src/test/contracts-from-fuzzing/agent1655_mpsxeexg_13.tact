struct NestedOptional {
  val: Int?;
  another: Bool?;
}

contract OptInStruct {
  data: NestedOptional?;

  init() {
    self.data = null;
  }
}