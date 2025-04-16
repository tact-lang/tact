contract AllFieldTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.intVal=1; self.boolVal=true; self.stringVal="str";
        self.addressVal=myAddress(); self.cellVal=emptyCell(); self.sliceVal=emptyCell().asSlice();
        self.optInt=null; self.optBool=false; self.optString=null;
        self.optAddress=null; self.optCell=emptyCell(); self.optSlice=null;
    }
}