struct BigNested {
  a: Int;  b: Bool; c: String; d: Cell; e: Slice;
  f: Builder; g: Address;
  h: SubNested;
}

struct SubNested {
  x: Int; y: Bool; z: String;
}

contract Test {
  bn: BigNested;
  init() {
    self.bn = BigNested{
      a: 1, b:true, c:"x", d:emptyCell(), e:emptyCell().asSlice(),
      f:beginCell(), g:myAddress(),
      h: SubNested{ x:2, y:false, z:"y" }
    };
  }
}