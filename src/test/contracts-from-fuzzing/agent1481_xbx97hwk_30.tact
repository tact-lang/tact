// Mixing nested structs, optionals and various primitives
struct ComplexInner {
  a: Int?;
  b: Bool;
  c: String?;
}

struct ComplexOuter {
  x: Int;
  y: ComplexInner?;
  z: Bool;
}

contract ComplexExample {
  data: ComplexOuter;
  init() {
    self.data = ComplexOuter{
      x:1,
      y: ComplexInner{ a:null, b:true, c:null },
      z: false
    };
  }
}