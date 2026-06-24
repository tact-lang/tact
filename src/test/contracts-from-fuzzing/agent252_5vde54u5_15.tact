struct StrNest {
  a: String;
  b: String?;
}

struct BoolNest {
  c: Bool;
  d: Bool?;
}

struct IntNest {
  e: Int;
  f: Int?;
}

struct Combo {
  s: StrNest;
  b: BoolNest;
  i: IntNest;
}

contract LotsOfTypes {
  c: Combo;

  init() {
    self.c = Combo{
      s: StrNest{a:"hi",b:null},
      b: BoolNest{c:true,d:null},
      i: IntNest{e:1,f:null}
    };
  }
}