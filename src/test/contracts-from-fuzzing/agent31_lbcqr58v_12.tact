struct Deep {
    a: Int;
    b: Mid;
}

struct Mid {
    c: Int;
    d: Inner;
}

struct Inner {
    e: Int;
    f: Int?;
}

contract Test {
    x: Deep;
    y: Deep;

    init() {
        self.x = Deep{
            a: 1,
            b: Mid{
                c: 2,
                d: Inner{ e: 3, f: null }
            }
        };

        self.y = Deep{
            a: 4,
            b: Mid{
                c: 5,
                d: Inner{ e: 6, f: null }
            }
        };
    }
}