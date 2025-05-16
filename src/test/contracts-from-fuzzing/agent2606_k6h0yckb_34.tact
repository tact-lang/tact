struct B {
  x: Int;
  y: Bool;
}

struct DeepNested {
  a: Int;
  b: B;
}

contract InlineStructSuccess {
  field: DeepNested;

  init() {
    self.field = DeepNested{ a:1, b:B{ x:2, y:false } };
  }
}