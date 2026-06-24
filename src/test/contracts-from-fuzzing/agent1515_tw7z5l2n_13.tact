struct NestedMix {
  a: Int?;
  b: Bool;
  c: String = "foo";
}

contract ComboTest {
  x: NestedMix;
  y: Bool = false;
  z: String = "bar";
  w: Int?;
  u: Bool?;

  init() {
    self.x = NestedMix{ a: 5, b: true, c: "baz" };
    self.w = null;
    self.u = true;
  }

  receive() { dump(self.x.c); }
}