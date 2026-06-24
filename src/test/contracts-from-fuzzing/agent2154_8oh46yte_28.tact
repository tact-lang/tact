struct AltTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract AltStructTest {
    data: AltTypes;

    init() {
        self.data = AltTypes{
            intVal:1,boolVal:true,addrVal:myAddress(),
            cellVal:emptyCell(),sliceVal:emptyCell().asSlice(),strVal:"hi"
        };
    }
}