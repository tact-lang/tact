struct StructWithStringOpt {
  s1: String;
  s2: String?;
}

contract TestContract {
  val: StructWithStringOpt;

  init() {
    self.val = StructWithStringOpt{
      s1: "hello",
      s2: null
    };
  }
}