struct LargeStruct {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: String;
  f: Int?;
  g: Bool?;
  h: Address?;
  i: Cell?;
  j: String?;
}

contract TestLargeStruct {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a:1, b:true, c:myAddress(), d:emptyCell(), e:"hi",
      f:null, g:null, h:null, i:null, j:null
    };
  }
}