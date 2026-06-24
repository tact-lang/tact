struct BigFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Bool?;
  h: Int?;
  i: String?;
  j: Address;
  k: Cell;
  l: Slice;
}

contract LotsOfFields {
  store: BigFields;

  init() {
    self.store = BigFields{
      a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),
      f:emptyCell().asSlice(),g:null,h:null,i:null,j:myAddress(),
      k:emptyCell(),l:emptyCell().asSlice()
    };
  }
}
