struct VeryDeep {
    d1: Int;
    d2: String;
}

struct Deep {
    c1: Bool;
    c2: VeryDeep;
}

struct Mid {
    b1: Int;
    b2: Deep;
}

struct Outer {
    a1: Bool;
    a2: Mid;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            a1: true,
            a2: Mid{
                b1: 5,
                b2: Deep{
                    c1: false,
                    c2: VeryDeep{
                        d1: 99,
                        d2: "end",
                    },
                },
            },
        };
    }

    receive() {}
}