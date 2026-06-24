struct AllPrims {
    intStd: Int;
    intSmall: Int as int32;
    uintBig: Int as uint128;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    addr: Address;
    optAddr: Address?;
    cellVal: Cell;
    optCell: Cell?;
    sliceVal: Slice;
    optSlice: Slice?;
}

contract TestContract {
    store: AllPrims;

    init() {
        self.store = AllPrims{
            intStd: 123,
            intSmall: -42,
            uintBig: 999999999999999,
            optInt: null,
            boolVal: true,
            optBool: false,
            addr: myAddress(),
            optAddr: null,
            cellVal: emptyCell(),
            optCell: null,
            sliceVal: emptyCell().asSlice(),
            optSlice: null
        };
    }
}