struct ManyFields {
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
  m: Int;
  n: Bool;
  o: String;
}

contract TestContract {
  large: ManyFields;

  init() {
    self.large = ManyFields{
      a:1,b:true,c:"c",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),
      g:null,h:null,i:null,j:null,k:null,l:null,m:42,n:false,o:"done"
    };
  }
}
