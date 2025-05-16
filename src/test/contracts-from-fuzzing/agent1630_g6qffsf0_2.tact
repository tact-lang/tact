struct Inner {
  num: Int;
  flag: Bool;
  txt: String;
}

contract NestedFields {
  details: Inner;

  init() {
    self.details = Inner{ num: 42, flag: true, txt: "hello" };
  }
}