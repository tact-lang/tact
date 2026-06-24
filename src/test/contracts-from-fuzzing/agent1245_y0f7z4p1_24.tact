struct ContainsBool {
  foo: Bool;
  bar: Bool;
}

struct ContainsOptStr {
  msg: String?;
}

contract CrossStruct {
  a: ContainsBool;
  b: ContainsOptStr;

  init() {
    self.a = ContainsBool { foo: true, bar: false };
    self.b = ContainsOptStr { msg: null };
  }
}
