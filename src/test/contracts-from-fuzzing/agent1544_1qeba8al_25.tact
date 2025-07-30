struct InnerOptional {
  foo: Int?;
}

contract OptionalInStruct {
  val: InnerOptional;

  init() {
    self.val = InnerOptional{ foo: null };
  }
}
