struct BigNested {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Cell?;
    l: Slice?;
}

contract BigNestedTest {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}