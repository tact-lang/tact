struct Reordered {
  b: Bool;
  a: Int;
  c: String;
}

contract FieldOrder {
  s: Reordered;

  init() {
    self.s = Reordered{ a:1, b:true, c:"ok" };
  }
}
