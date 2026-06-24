struct SerializeTest {
  a: Int as int32;
  b: Int as uint8;
  c: Bool;
  d: String;
}

contract Test {
  st: SerializeTest;
  init() { self.st = SerializeTest{ a: 1, b: 2, c: true, d: "hi" }; }
}