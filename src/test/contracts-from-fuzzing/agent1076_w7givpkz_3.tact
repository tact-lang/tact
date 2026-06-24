struct Optionals {
  foo: Int?;
  bar: Bool?;
  str: String?;
}

contract TestOptionals {
  payload: Optionals;

  init() {
    self.payload = Optionals{foo: null, bar: false, str: "hello"};
  }
}
