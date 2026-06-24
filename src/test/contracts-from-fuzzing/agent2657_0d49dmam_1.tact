struct InnerNested {
  foo: Int;
  bar: Bool;
}

struct OuterNested {
  baz: String;
  nested: InnerNested;
  optBool: Bool?;
}

contract TestContract {
  val1: Int = 0;
  val2: Bool = false;
  val3: String = "";
  nestedStruct: OuterNested = OuterNested{ baz: "", nested: InnerNested{ foo: 0, bar: false }, optBool: null };

  init() {
    self.val1 = 1;
    self.val2 = true;
    self.val3 = "hi";
    self.nestedStruct = OuterNested{ baz: "hello", nested: InnerNested{ foo: 42, bar: true }, optBool: true };
  }
}
