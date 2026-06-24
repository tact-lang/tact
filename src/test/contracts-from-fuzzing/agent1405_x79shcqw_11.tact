struct ComplexStruct {
  s: String;
  flag: Bool;
  count: Int;
  nested: Nested;
}

struct Nested {
  x: Int;
  y: Int;
}

contract ComplexContract {
  data: ComplexStruct;

  init() {
    self.data = ComplexStruct{
      s: "test", flag: true, count: 42,
      nested: Nested{ x:1, y:2 }
    };
  }

  receive() {
    let _ = self.data;
  }
}