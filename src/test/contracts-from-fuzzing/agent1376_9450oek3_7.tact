struct Complex {
  a: Int;
  b: Bool;
  c: String?;
  d: Address;
  e: Cell;
  f: Slice;
  g: Bool?;
  h: Int?;
  i: String?;
  j: Address;
  k: Cell;
  l: Slice;
  m: Int;
  n: Int;
  o: Int;
}

contract BigPersistent {
  field1: Complex;
  field2: Complex;

  init() {
    self.field1 = Complex{ a:1,b:true,c:null,d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:null,h:null,i:null,j:myAddress(),k:emptyCell(),l:emptyCell().asSlice(),m:1,n:2,o:3 };
    self.field2 = self.field1;
  }
}
