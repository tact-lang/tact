contract Test {
  intVal: Int;
  boolVal: Bool;
  cellVal: Cell;
  sliceVal: Slice;
  addressVal: Address;
  stringVal: String;
  optInt: Int?;
  optBool: Bool?;
  optCell: Cell?;
  optSlice: Slice?;
  optAddress: Address?;
  optString: String?;

  init() {
    self.intVal=1; self.boolVal=true; self.cellVal=emptyCell(); self.sliceVal=emptyCell().asSlice();
    self.addressVal=myAddress(); self.stringVal="abc";
    self.optInt=null; self.optBool=null; self.optCell=null; self.optSlice=null; self.optAddress=null; self.optString=null;
  }
}