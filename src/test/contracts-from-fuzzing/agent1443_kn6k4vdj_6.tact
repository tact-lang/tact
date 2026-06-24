struct Combo {
    a: Bool;
    b: Int?;
    c: String;
    d: Bool?;
    e: Int;
    f: String?;
    g: Cell;
    h: Slice;
    i: Cell?;
    j: Slice?;
}

contract ComboContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: true,
            b: null,
            c: "hi",
            d: false,
            e: 42,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: null,
            j: null
        };
    }

    receive() {}
}