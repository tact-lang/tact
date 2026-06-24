struct NestedOptionalStruct {
  s: Simple?;
  b: Bool?;
}

struct Simple {
  foo: Int;
}

contract TestNestedOptStruct {
  data: NestedOptionalStruct;

  init() {
    self.data = NestedOptionalStruct{
      s: Simple{foo: 5},
      b: true
    };
  }
}
