struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String;
    i: Cell;
    j: Slice;
}

contract WideStructInStorage {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1, b: false, c: "x", d: emptyCell(), e: emptyCell().asSlice(),
            f: null, g: null, h: "y", i: emptyCell(), j: emptyCell().asSlice()
        };
    }
}