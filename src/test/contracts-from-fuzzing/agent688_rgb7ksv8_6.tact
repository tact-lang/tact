struct Various {
    a: Int;
    b: Bool;
    c: Address?;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract StructFieldsTest {
    s: Various;

    init() {
        self.s = Various{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: null,
            h: false,
            i: null
        };
    }
}
