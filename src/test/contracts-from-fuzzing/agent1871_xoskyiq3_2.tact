struct Inner {
  x: Int;
  y: Bool;
  z: String;
}

contract NestedTest {
  data: Inner;

  init() {
    self.data = Inner{ x: 13, y: true, z: "z" };
  }
}