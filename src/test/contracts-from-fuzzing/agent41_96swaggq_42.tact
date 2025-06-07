struct NestedInits {
  a: NestA;
}

struct NestA {
  b: Int;
  c: NestB;
}

struct NestB {
  d: Bool;
  e: NestC;
}

struct NestC {
  f: String;
  g: Bool?;
}

contract MultiNestInit {
  s: NestedInits;

  init() {
    self.s = NestedInits{
      a: NestA{
        b:1,
        c: NestB{
          d:true,
          e: NestC{
            f:"f",
            g:null
          }
        }
      }
    };
  }
}
