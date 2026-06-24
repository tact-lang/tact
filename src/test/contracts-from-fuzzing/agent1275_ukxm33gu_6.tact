struct MultiTypes {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
}

contract MixedFieldTypes {
  data: MultiTypes;

  init() {
    self.data = MultiTypes{
      a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"test"
    };
  }
}