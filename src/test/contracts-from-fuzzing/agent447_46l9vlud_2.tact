struct Nested {
  val: Int;
  optVal: Int?;
  text: String;
}

contract DeepTest {
  nested: Nested;

  init() {
    self.nested = Nested{ val: 5, optVal: null, text: "abc" };
  }
}