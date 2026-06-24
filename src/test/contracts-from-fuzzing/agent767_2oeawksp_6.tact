struct LargeNested {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: String;
    f: Slice;
    g: Address;
}

contract LargeStructTest {
    field: LargeNested;

    init() {
        self.field = LargeNested{
            a: 1,
            b: 2,
            c: null,
            d: true,
            e: "hi",
            f: emptyCell().asSlice(),
            g: myAddress()
        };
    }
}