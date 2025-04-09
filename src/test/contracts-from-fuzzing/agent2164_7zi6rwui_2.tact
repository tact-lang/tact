struct BigFieldSet {
  a: Int;
  b: Int;
  c: Bool;
  d: String;
  e: Cell;
  f: Slice;
  g: Address;
  h: Int?;
  i: Bool?;
  j: String;
  k: Slice;
  l: Cell;
  m: Address;
}

contract Test {
  data: BigFieldSet;

  init() {
    self.data = BigFieldSet{
      a:1, b:2, c:true, d:"hi", e:emptyCell(), f:emptyCell().asSlice(),
      g:myAddress(), h:null, i:null, j:"bye", k:emptyCell().asSlice(),
      l:emptyCell(), m:myAddress()
    };
  }
}
