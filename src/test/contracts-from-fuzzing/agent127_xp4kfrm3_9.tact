struct Combo {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ComboFields {
    data: Combo;
    init() {
        self.data = Combo{
            i: 1,
            b: false,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}