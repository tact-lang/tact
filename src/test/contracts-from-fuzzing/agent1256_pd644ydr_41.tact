struct DeepNest {
  a: Int;
  b: InnerNest;
  c: Bool;
}

struct InnerNest {
  x: Int;
  y: String;
}

contract CombineMixed {
  data: DeepNest;

  init() {
    self.data = DeepNest{
      a:3,
      b: InnerNest { x: 7, y: "abc" },
      c:true
    };
  }
}
