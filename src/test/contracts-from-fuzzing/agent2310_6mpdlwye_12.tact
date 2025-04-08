struct Complex {
  a: Int;
  b: Bool?;
  c: String;
  d: InnerStruct;
}

struct InnerStruct {
  x: Int?;
  y: Bool;
  z: String?;
}

contract NestedStructs {
  val: Complex;

  init() {
    self.val = Complex{
      a: 5, b: null, c: "hey",
      d: InnerStruct{ x: null, y: true, z: null }
    };
  }
}