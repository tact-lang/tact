struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Slice;
    k: Cell;
    l: Address;
}

contract WideTest {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: true,
            c: "x",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
            i: "y",
            j: emptyCell().asSlice(),
            k: emptyCell(),
            l: myAddress(),
        };
    }
}