struct Complex {
    i: Int;
    str: String;
    c: Cell;
    addr: Address;
    sl: Slice;
    bld: Builder;
    optI: Int?;
    optStr: String?;
    optC: Cell?;
    optAddr: Address?;
    optSl: Slice?;
    optBld: Builder?;
}

contract AllTypes {
    data: Complex;
    init() {
        self.data = Complex{
            i: 1,
            str: "s",
            c: emptyCell(),
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            bld: beginCell(),
            optI: null,
            optStr: null,
            optC: null,
            optAddr: null,
            optSl: null,
            optBld: null,
        };
    }
}
