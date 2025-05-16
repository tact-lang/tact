struct OptsWide {
    a: Int?;
    b: Int? as uint64;
    c: Bool?;
    d: Address?;
    e: String?;
    f: Cell?;
    g: Slice?;
    h: Builder?;
}

contract TestContract {
    options: OptsWide;

    init() {
        self.options = OptsWide{
            a: null,
            b: null,
            c: true,
            d: myAddress(),
            e: "abc",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: beginCell()
        };
    }
}
