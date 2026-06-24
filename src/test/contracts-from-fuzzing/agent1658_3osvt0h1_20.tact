struct DeepSparse {
  a: Int;
  b: String?;
  c: Int;
  d: Bool?;
  e: Cell?;
  f: Slice;
  g: Builder?;
  h: Address;
}

contract SparseFields {
  s: DeepSparse;

  init() {
    self.s = DeepSparse{
      a:1, b:null, c:3, d:null, e:null, f:emptyCell().asSlice(), g:null, h:myAddress()
    };
  }
}