struct Composed {
  intVal: Int;
  boolVal: Bool;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  stringVal: String;
  optInt: Int?;
  optBool: Bool?;
  optAddress: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optString: String?;
}

contract AllTypes {
  field: Composed;

  init() {
    self.field = Composed{
      intVal:1, boolVal:true, addrVal:myAddress(), cellVal:emptyCell(), sliceVal:emptyCell().asSlice(), stringVal:"hi",
      optInt:null, optBool:null, optAddress:null, optCell:null, optSlice:null, optString:null
    };
  }
}