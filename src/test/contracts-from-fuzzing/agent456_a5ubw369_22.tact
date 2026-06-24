struct Rec {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optCell: Cell?;
    optStr: String?;
}

contract Combo {
    rec: Rec;

    init() {
        self.rec = Rec{
            intVal: 42,
            boolVal: true,
            strVal: "hey",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optCell: null,
            optStr: null
        };
    }
}