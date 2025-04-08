struct Mix {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;
  k: Slice;
  l: Slice?;
}

contract MixDepth {
  m: Mix;
  init() {
    self.m = Mix{
      a:1,
      b:null,
      c:true,
      d:false,
      e:"abc",
      f:null,
      g:myAddress(),
      h:null,
      i:emptyCell(),
      j:null,
      k:emptyCell().asSlice(),
      l:null
    };
  }
}
