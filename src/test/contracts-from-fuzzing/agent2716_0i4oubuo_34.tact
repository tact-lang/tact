struct Nested1 { f1: Int; }
struct Nested2 { f2: Nested1; }
struct Nested3 { f3: Nested2; }

struct HasOpt {
  x: Int;
  y: Int?;
  z: Nested3?;
}

contract OptNestedComplex {
  data: HasOpt;
  init() {
    self.data = HasOpt{x:1,y:null,z:null};
  }
}