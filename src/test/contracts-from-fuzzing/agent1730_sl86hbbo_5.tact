struct DeepStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Bool?;
  h: Int?;
  i: String?;
  j: Cell?;
  k: Slice?;
  l: Address?;
}

contract VarietyTest {
  data: DeepStruct;

  init() {
    self.data = DeepStruct{
      a:1, b:true, c:"x", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(), g:null, h:null, i:null, j:null, k:null, l:null
    };
  }
}