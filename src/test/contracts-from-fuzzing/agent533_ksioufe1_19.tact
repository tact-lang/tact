struct Varied {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: Int?;
  g: Bool?;
  h: Address?;
  i: Cell?;
  j: Slice?;
  k: String;
  l: String?;
}

contract VariedContract {
  val: Varied;

  init() {
    self.val = Varied{
      a:1,
      b:false,
      c:myAddress(),
      d:emptyCell(),
      e:emptyCell().asSlice(),
      f:null,
      g:true,
      h:null,
      i:null,
      j:null,
      k:"test",
      l:null
    };
  }
}