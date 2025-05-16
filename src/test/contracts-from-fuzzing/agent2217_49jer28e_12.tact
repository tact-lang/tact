struct Combo {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cl: Cell;
    sl: Slice;
    optInt: Int?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract Mix {
    data: Combo;

    init() {
        self.data = Combo{
            i: 1,
            b: false,
            s: "hi",
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            optInt: null,
            optAddr: null,
            optStr: null,
            optCell: null,
            optSlice: null
        };
    }
}
