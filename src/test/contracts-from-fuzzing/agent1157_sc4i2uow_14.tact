struct Deep {
    a: Int;
    b: String;
}

struct Deeper {
    c: Deep;
    d: Int;
}

struct Deepest {
    e: Deeper;
    f: Int?;
    g: Bool;
}

contract DeepStorage {
    x: Deepest;

    init() {
        self.x = Deepest{
            e: Deeper{
                c: Deep{ a: 12, b: "xyz" },
                d: 123
            },
            f: null,
            g: true
        };
    }
}