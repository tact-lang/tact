struct InnerA { a: Int }
struct InnerB { b: Int }
struct InnerC { c: Int }

struct MegaStruct {
  inA: InnerA;
  inB: InnerB;
  inC: InnerC;
}

contract MultiInnerStruct {
  s: MegaStruct;

  init() {
    self.s = MegaStruct{
      inA: InnerA{a:1},
      inB: InnerB{b:2},
      inC: InnerC{c:3}
    };
  }
}