struct Simple {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract Test {
    data: Simple;

    init() {
        self.data = Simple{
            a: 12,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}