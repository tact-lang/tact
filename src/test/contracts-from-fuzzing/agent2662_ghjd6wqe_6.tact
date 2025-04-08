struct LargeNested {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Int?;
    e: Cell;
    f: Bool?;
    g: String?;
}

contract AllTypes {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            a: 255,
            b: true,
            c: "World",
            d: 100,
            e: emptyCell(),
            f: null,
            g: "Hi",
        };
    }
}