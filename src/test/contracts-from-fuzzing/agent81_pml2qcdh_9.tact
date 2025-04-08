struct VeryDeep {
    d1: Int;
    d2: Deep;
}

struct Deep {
    e1: Int;
    e2: Deeper;
}

struct Deeper {
    f1: Int;
    f2: Bool;
}

contract Complex {
    field: VeryDeep;

    init() {
        self.field = VeryDeep{
            d1: 1,
            d2: Deep{
                e1: 2,
                e2: Deeper{
                    f1: 3,
                    f2: true
                }
            }
        };
    }
}
