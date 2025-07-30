// combining nested structs, optionals, and many primitive fields
struct Complex {
  i: Int;
  flag: Bool?;
  txt: String;
}

struct SuperComplex {
  a: Int?;
  b: Complex;
  c: Bool;
  d: String?;
}

contract CrazyTest {
  content: SuperComplex;

  init() {
    self.content = SuperComplex{
      a: null,
      b: Complex{ i:1, flag:true, txt:"hi"},
      c: true,
      d: null,
    };
  }
}