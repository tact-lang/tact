struct Wide {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Int;
    g: Bool;
    h: String;
    i: Cell;
    j: Slice;
}

contract WideTest {
    s: Wide;

    init() {
        self.s = Wide{
            a: null, b: null, c: null, d: null, e: null,
            f: 1, g: true, h: "ok", i: emptyCell(), j: emptyCell().asSlice(),
        };
    }

    receive() {}
}