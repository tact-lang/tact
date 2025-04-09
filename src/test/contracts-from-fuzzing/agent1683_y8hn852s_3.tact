struct OptionalFields {
  foo: Int?;
  bar: Bool?;
  baz: Address?;
  corge: String?;
}

contract TestOptionals {
  opts: OptionalFields;

  init() {
    self.opts = OptionalFields{};
  }

  receive() {
    self.opts = OptionalFields{ foo: 1, bar: true, baz: myAddress(), corge: "hi" };
  }
}