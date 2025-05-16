// Test optional nested structs with defaults inside
struct InnerHasDef {
  x: Int = 10;
  y: Bool = false;
}

struct OuterOpt {
  i1: InnerHasDef?;
  i2: InnerHasDef?;
}

contract NestedOptWithDef {
  o: OuterOpt;
  init() {
    self.o = OuterOpt { i1:null, i2:null };
  }
}