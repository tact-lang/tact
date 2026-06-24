struct BigNested {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Slice?;
  k: Cell?;
  l: Address?;
}

contract ComplexStorage {
  data: BigNested;

  init() {
    self.data = BigNested{
      a:1, b:true, c:"s", d:emptyCell().asSlice(), e:emptyCell(), f:myAddress(),
      g:null, h:null, i:null, j:null, k:null, l:null
    };
  }

  receive() {
    let _ = self.data.b;
  }
}
