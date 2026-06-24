contract CrossTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal=5;
        self.boolVal=true;
        self.stringVal="hello";
        self.addrVal=myAddress();
        self.cellVal=emptyCell();
        self.sliceVal=emptyCell().asSlice();
    }
}