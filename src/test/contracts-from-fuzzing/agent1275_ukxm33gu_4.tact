struct ChainA { b: ChainB; }
struct ChainB { c: ChainC; }
struct ChainC { d: ChainD; }
struct ChainD { e: ChainE; }
struct ChainE { val: Int; }

contract DeepChainStruct {
  field: ChainA;

  init() {
    self.field = ChainA{ b: ChainB{ c: ChainC{ d: ChainD{ e: ChainE{ val: 42 }}}}};
  }
}