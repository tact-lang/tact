struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Address;
  f: Cell;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Slice?;
  k: Address?;
  l: Cell?;
}

contract LargeStructContract {
  x: LargeStruct;

  init() {
    self.x = LargeStruct{
      a:1,b:true,c:"t",d:emptyCell().asSlice(),e:myAddress(),f:emptyCell(),
      g:null,h:null,i:null,j:null,k:null,l:null
    };
  }
}