struct Rec {
    s: String;
    a: Address;
    cl: Cell;
    sl: Slice;
    flag: Bool;
    big: Int as int256;
    small: Int as uint8;
    opt: Int?;
}

contract PrimitiveMix {
    r: Rec;
    init() {
        self.r = Rec{
            s: "data",
            a: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            flag: false,
            big: -123456,
            small: 7,
            opt: null
        };
    }
}