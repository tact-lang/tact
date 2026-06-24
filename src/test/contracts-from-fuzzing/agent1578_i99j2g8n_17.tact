struct ManyMixed {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    val: ManyMixed;

    init() {
        let c = emptyCell();
        self.val = ManyMixed{
            intVal: 7,
            boolVal: true,
            strVal: "x",
            addrVal: myAddress(),
            cellVal: c,
            sliceVal: c.asSlice(),
            builderVal: beginCell(),
            optInt: null,
            optBool: false,
            optStr: null
        };
    }
}