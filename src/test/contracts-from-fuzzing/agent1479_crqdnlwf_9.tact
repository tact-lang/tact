struct Bottom {
    a: Int;
    b: Bool;
}

struct Middle {
    c: Bottom;
    d: Int?;
}

struct Top {
    e: Middle;
    f: Bool;
}

contract Test {
    s: Top;
    init() {
        self.s = Top{
            e: Middle{
                c: Bottom{
                    a: 1,
                    b: false
                },
                d: null
            },
            f: true
        };
    }
}