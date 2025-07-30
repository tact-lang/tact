struct Deep {
    a: Int;
    b: String;
    c: Bool?;
}

struct Middle {
    d: Int;
    e: Deep;
    f: Deep?;
}

struct Top {
    g: Middle;
    h: Middle?;
}

contract MultiNested {
    param: Top;

    init() {
        self.param = Top{
            g: Middle{ d: 1, e: Deep{ a: 2, b: "b", c: null }, f: null },
            h: null,
        };
    }
}