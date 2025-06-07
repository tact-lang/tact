struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    l: Cell;
    m: Slice;
    n: Address;
}

contract BigFields {
    stuff: Large;
    init() {
        self.stuff = Large{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: "hello",
            i: 9,
            j: false,
            k: "bye",
            l: emptyCell(),
            m: emptyCell().asSlice(),
            n: myAddress(),
        };
    }
}