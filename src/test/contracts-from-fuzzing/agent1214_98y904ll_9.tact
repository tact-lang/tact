struct Levels {
    a: Int;
    b: String;
    c: Bool;
    d: Optionals;
}

struct Optionals {
    e: Int?;
    f: String?;
    g: Nested?;
}

struct Nested {
    h: Bool;
}

contract Test9 {
    s: Levels;
    init() {
        self.s = Levels{
            a: 1,
            b: "deep",
            c: true,
            d: Optionals{
                e: null,
                f: "opt",
                g: Nested{
                    h: false
                },
            },
        };
    }
}