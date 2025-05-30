struct Nested {
  x: Int;
  y: Bool;
  z: String?;
}

struct Outer {
  inner: Nested;
  val: Int;
}

contract StorageTest {
  field: Outer;

  init() {
    self.field = Outer{ inner: Nested{ x: 42, y: true, z:null }, val: 7 };
  }
}