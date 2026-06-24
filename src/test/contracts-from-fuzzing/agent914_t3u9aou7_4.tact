struct LongStruct {
  a: Int;
  b: Bool;
  c: Address?;
  d: Cell;
  e: Slice;
  f: String;
  g: Int;
  h: Bool;
  i: Address?;
  j: Cell;
  k: Slice;
  l: String;
  m: Int;
  n: Bool;
  o: Address?;
}

contract LongStructField {
  field: LongStruct;

  init() {
    self.field = LongStruct{
      a:1,b:true,c:null,d:emptyCell(),e:emptyCell().asSlice(),
      f:"hi",g:2,h:false,i:null,j:emptyCell(),k:emptyCell().asSlice(),
      l:"ok",m:3,n:true,o:null
    };
  }
}