struct StructA { x: Int }
struct StructB { y: Int }
struct StructC { z: Int }
struct StructD { w: Int }
struct StructE { v: Int }

struct MultiStruct {
  a: StructA;
  b: StructB;
  c: StructC;
  d: StructD;
  e: StructE;
}

contract MultiStructLevels {
  data: MultiStruct;

  init() {
    self.data = MultiStruct{
      a: StructA{x:1},
      b: StructB{y:2},
      c: StructC{z:3},
      d: StructD{w:4},
      e: StructE{v:5}
    };
  }
}