struct Varied {
  intF: Int;
  boolF: Bool;
  stringF: String;
  optionalInt: Int?;
  cellF: Cell;
  optionalBool: Bool?;
  sliceF: Slice;
}

contract AllTypes {
  data: Varied;

  init() {
    self.data = Varied{
      intF:1, boolF:true, stringF:"x", optionalInt:null, cellF:emptyCell(), optionalBool:null, sliceF:emptyCell().asSlice()
    };
  }
}