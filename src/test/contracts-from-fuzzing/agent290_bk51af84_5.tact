struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: String?;
    i: Int?;
}

contract Test {
    large: Large;

    init() {
        self.large = Large{
            a: 1,
            b: true,
            c: "ok",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null
        };
    }
}