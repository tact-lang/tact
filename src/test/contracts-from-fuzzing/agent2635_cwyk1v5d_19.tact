struct SOpt1 {
  foo: Int?;
}

struct SOpt2 {
  bar: String?;
}

contract MultiOpt {
  x: SOpt1;
  y: SOpt2;
  
  init() {
    self.x = SOpt1{ foo: null };
    self.y = SOpt2{ bar: null };
  }
}