contract FullTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    stringVal: String;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.intVal=1;
        self.boolVal=true;
        self.cellVal=emptyCell();
        self.builderVal=beginCell();
        self.sliceVal=emptyCell().asSlice();
        self.stringVal="hi";
        self.addressVal=myAddress();
        self.optInt=2;
        self.optBool=null;
        self.optString="hey";
    }
}
