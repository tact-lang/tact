struct One {
    a: Int;
}

struct Two {
    aa: One;
    bb: One;
}

struct Three {
    x: Two;
    y: Two;
}

contract BigNest {
    f: Three;

    init() {
        self.f = Three{
            x: Two{
                aa: One{ a: 1 },
                bb: One{ a: 2 }
            },
            y: Two{
                aa: One{ a: 3 },
                bb: One{ a: 4 }
            }
        };
    }
}