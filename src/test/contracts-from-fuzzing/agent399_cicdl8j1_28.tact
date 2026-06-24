struct OuterVoid {
  x: Int;
}

struct InnerVoid {
  y: Bool;
}

contract MultipleStructFields {
  a: OuterVoid;
  b: InnerVoid;

  init() {
    self.a = OuterVoid{ x:42 };
    self.b = InnerVoid{ y:true };
  }
}