// mixing optionals, deep struct nesting, and primitives
struct XP {
  a: Int?;
  b: Bool;
}

struct YP {
  x: XP?;
}

struct ZP {
  y: YP; 
}

contract MixTest {
  top: ZP = ZP{ y: YP{ x: null } };
}