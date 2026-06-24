// contract with long nested structs, set fields in init
struct BlockA {
  a: Int; b: Int; c: Int;
}

struct BlockB {
  d: Bool; e: Bool; f: Bool;
}

struct BlockC {
  g: String; h: Address; i: Slice;
}

struct Composer {
  ba: BlockA;
  bb: BlockB;
  bc: BlockC;
}

contract NestedMany {
  data: Composer;

  init() {
    self.data = Composer{
      ba: BlockA{ a:1, b:2, c:3 },
      bb: BlockB{ d:true, e:false, f:true },
      bc: BlockC{ g:"h", h:myAddress(), i:emptyCell().asSlice() },
    };
  }
}