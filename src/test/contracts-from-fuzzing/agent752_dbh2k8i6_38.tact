struct InnerStr {
  foo: String;
}

contract TopContainer {
  val: InnerStr;

  init() {
    self.val = InnerStr{ foo: "bar" };
  }
}