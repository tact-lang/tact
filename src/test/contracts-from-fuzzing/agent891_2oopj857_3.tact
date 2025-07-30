struct WithOptional {
  a: Int;
  b: Bool?;
  c: String?;
  d: Address;
}

contract OptStructFields {
  val: WithOptional;

  init() {
    self.val = WithOptional{
      a: -10,
      b: null,
      c: null,
      d: myAddress(),
    };
  }
}