struct Sub {
  foo: Int;
  bar: String?;
}
contract NestedBigOptional {
  s: Sub? = null;

  init() {
    self.s = Sub{ foo: 123, bar: "hi" };
  }
}
