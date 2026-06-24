// Persistence of nested struct with optional fields partially null
struct Sub {
  a: Int?;
  b: Bool;
}

struct Top {
  sub: Sub;
  s: String?;
}

contract PartNull {
  val: Top;

  init() {
    self.val = Top{ sub: Sub{ a: null, b: false }, s: null };
  }
}