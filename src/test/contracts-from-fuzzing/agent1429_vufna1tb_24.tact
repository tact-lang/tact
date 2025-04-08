struct Tiny { x: Int; y: Int; }

struct Big {
    f1: Tiny;
    f2: Tiny;
    f3: Tiny;
    f4: Tiny;
    f5: Tiny;
}

contract ManyInnerStructs {
    data: Big;

    init() {
        self.data = Big{
            f1: Tiny{ x:1, y:2 },
            f2: Tiny{ x:3, y:4 },
            f3: Tiny{ x:5, y:6 },
            f4: Tiny{ x:7, y:8 },
            f5: Tiny{ x:9, y:10 },
        };
    }
}