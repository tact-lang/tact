struct Base {
    a: Int;
}

struct Middle {
    base: Base;
    b: Int;
}

struct Top {
    mid: Middle;
    c: Int;
}

contract MultiNest {
    data: Top;
    init() {
        self.data = Top{
            mid: Middle{
                base: Base{ a:1 },
                b: 2
            },
            c: 3
        };
    }
}
