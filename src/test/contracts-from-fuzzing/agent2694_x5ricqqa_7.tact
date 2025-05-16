struct MultiType {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    addrVal: Address;
}

contract TestContract {
    info: MultiType;

    init() {
        self.info = MultiType{
            intVal:42,
            boolVal:true,
            sliceVal:emptyCell().asSlice(),
            cellVal:emptyCell(),
            strVal:"hello",
            addrVal:myAddress()
        };
    }
}
