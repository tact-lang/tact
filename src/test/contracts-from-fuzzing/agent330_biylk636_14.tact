struct Complex1 {
  intf: Int;
  boolf: Bool;
}

struct Complex2 {
  s: String;
  cell: Cell;
  nested: Complex1;
}

contract MultiNested {
  a: Complex1;
  b: Complex2;

  init() {
    self.a = Complex1{intf:1, boolf:false};
    self.b = Complex2{s:"text", cell:emptyCell(), nested: self.a};
  }
}
