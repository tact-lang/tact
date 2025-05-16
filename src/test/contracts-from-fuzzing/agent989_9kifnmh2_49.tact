struct Grouped {
  a: Int;
  b: Bool;
  c: String;
}

contract GroupedFields {
  f1: Grouped;

  init() {
    self.f1 = Grouped{ a:1, b:true, c:"ok" };
  }
}