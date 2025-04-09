struct NestA {
  x: Int;
}
struct NestB {
  a: NestA;
}
struct NestC {
  b: NestB;
}
struct NestD {
  c: NestC;
}
struct NestE {
  d: NestD;
}

contract Deep5 {
    data: NestE;

    init() {
        self.data = NestE {
            d: NestD {
                c: NestC {
                    b: NestB {
                        a: NestA {
                            x: 77
                        }
                    }
                }
            }
        };
    }
}