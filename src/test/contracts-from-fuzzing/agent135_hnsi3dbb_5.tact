struct Multi {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Int?;
    g: Bool?;
    h: Cell?;
    i: String?;
}

contract Test {
    m: Multi;

    init() {
        self.m = Multi{
            a: 1, b: true, c: emptyCell(), d: emptyCell().asSlice(),
            e: "hello", f: null, g: false, h: null, i: null
        };
    }
}