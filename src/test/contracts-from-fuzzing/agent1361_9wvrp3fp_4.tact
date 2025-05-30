struct WideStruct {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract WideStructTest {
    ws: WideStruct;

    init() {
        self.ws = WideStruct{
            intVal: 5,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hi"
        };
    }
}