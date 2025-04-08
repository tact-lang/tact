struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Level2;
}

struct Level2 {
    e: Level3;
    f: String;
}

struct Level3 {
    g: Bool;
    h: Int;
}

contract NestedComplex {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: false,
            c: "hi",
            d: Level2{
                e: Level3{ g: true, h: 42 },
                f: "ok",
            },
        };
    }
}