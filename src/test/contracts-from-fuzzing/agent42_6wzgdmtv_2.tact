struct Nested {
  x: Int;
  y: Bool;
  z: String;
}

struct Outer {
  field1: Int;
  nested: Nested;
  field2: String;
}

contract TestContract {
  value: Outer;

  init() {
    self.value = Outer{
      field1: 42,
      nested: Nested{ x:1, y:false, z:"hi" },
      field2: "outer"
    };
  }
}