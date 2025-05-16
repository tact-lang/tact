struct Combined {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String?;
}

contract VariedTypes {
  val: Combined;
  init() {
    self.val = Combined{
      a: 1, b: true, c: "hello", d: null, e: null
    };
  }
}