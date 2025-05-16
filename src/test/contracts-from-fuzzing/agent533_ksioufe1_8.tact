struct BigMix {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Cell;
  f: Cell?;
  g: Slice;
  h: Slice?;
  i: Address;
  j: Address?;
  k: String;
  l: String?;
}

contract DiverseFields {
  val: BigMix;

  init() {
    self.val = BigMix{
      a:1,
      b:null,
      c:true,
      d:null,
      e:emptyCell(),
      f:null,
      g:emptyCell().asSlice(),
      h:null,
      i:myAddress(),
      j:null,
      k:"hello",
      l:null
    };
  }
}