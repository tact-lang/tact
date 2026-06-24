struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
}

contract TestContract {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            intVal: 10,
            boolVal: true,
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            strVal: "hi",
            optInt: null,
            optBool: false,
            optAddr: null,
            optStr: "hello"
        };
    }
}