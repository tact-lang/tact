struct NestA {
  x: Int;
}
struct NestB {
  a: Int;
  ref: NestA;
}
struct NestC {
  b: Int;
  ref: NestB;
}

contract ChainNest {
  nest: NestC;

  init() {
    self.nest = NestC{
      b:1,
      ref: NestB{
        a:2,
        ref: NestA{
          x:3
        }
      }
    };
  }
}