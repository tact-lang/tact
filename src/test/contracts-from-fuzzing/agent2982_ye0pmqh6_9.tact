struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: String?;
}

contract ManyOptionalFieldsTest {
    opts: ManyOpts = ManyOpts{ a: null, b: null, c: null, d: null, e: null, f: null, g: null };

    init() {
        self.opts = ManyOpts{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: "string"
        };
    }
}