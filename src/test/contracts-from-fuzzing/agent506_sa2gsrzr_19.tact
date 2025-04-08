struct NestedWithOption {
  a: Int;
  b: Bool?;
  c: String?;
}

contract NestedOptionals {
  val: NestedWithOption;

  init() {
    self.val = NestedWithOption{
      a: 5,
      b: null,
      c: "hi"
    };
  }
}