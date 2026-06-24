struct MiddleStr {
  val: String;
}

struct OuterHasString {
  nested: MiddleStr;
}

contract NestedStringStruct {
  f: OuterHasString;

  init() {
    self.f = OuterHasString{ nested: MiddleStr{ val: "hi" } };
  }
}