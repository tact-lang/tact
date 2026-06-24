struct CombineAll {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddr: Address?;
}

contract AllTypes {
    data: CombineAll;

    init() {
        self.data = CombineAll{
            intVal: 1,
            boolVal: true,
            strVal: "abc",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress(),
            optInt: null, optBool: null, optStr: null, optCell: null, optAddr: null
        };
    }
}