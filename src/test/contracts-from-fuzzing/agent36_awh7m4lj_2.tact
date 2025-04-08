struct Nested {
  val1: Int;
  val2: Bool;
  s: String;
}

contract UseStruct {
  nested: Nested;

  init() {
    self.nested = Nested{
      val1: 10,
      val2: false,
      s: "abc"
    };
  }
}
