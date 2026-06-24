struct LongList {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Cell?;
  l: Slice?;
  m: Int;
}

contract TestLong {
  val: LongList;

  init() {
    self.val = LongList{
      a: 1, b:true, c:"x", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
      g:null, h:null, i:null, j:null, k:null, l:null, m:100
    };
  }
}
