struct SDeep {
 a: Int;
}

struct MDeep {
 b: SDeep;
}

struct LDeep {
 c: MDeep;
}

struct UDeep {
 d: LDeep;
}

contract UltraDeep {
 u: UDeep;

 init() {
  self.u = UDeep{
   d: LDeep{
    c: MDeep{
     b: SDeep{
      a: 42
     }
    }
   }
  };
 }
}