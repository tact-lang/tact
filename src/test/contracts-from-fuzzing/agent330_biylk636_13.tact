struct Big {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Int?;
  g: Bool?;
  h: String?;
  i: Cell?;
  j: Slice?;
}

contract LargeStructField {
  field1: Big;
  field2: Big;
  init() {
    self.field1 = Big{a:1,b:true,c:"x",d:emptyCell(),e:emptyCell().asSlice(),f:null,g:null,h:null,i:null,j:null};
    self.field2 = Big{a:2,b:false,c:"y",d:emptyCell(),e:emptyCell().asSlice(),f:null,g:null,h:null,i:null,j:null};
  }
}
