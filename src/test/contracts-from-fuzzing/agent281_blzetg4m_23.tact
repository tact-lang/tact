// Contract with a large persistent struct with strings and optionals
struct BigStruct {
  a: Int;
  b: Int;
  c: String;
  d: String?;
  e: Bool;
  f: Bool?;
  g: Int?;
  h: String;
  i: Cell;
  j: Slice;
}

contract LargePersStruct {
  field: BigStruct;

  init() {
    self.field = BigStruct{
      a:1, b:2, c:"c", d:null, e:true, f:null, g:null, h:"h", i:emptyCell(), j:emptyCell().asSlice()
    };
  }
}