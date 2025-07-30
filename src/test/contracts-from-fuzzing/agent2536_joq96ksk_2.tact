struct Tiny {
    a: Int;
}

struct Medium {
    a: Tiny;
    b: Tiny;
}

struct Large {
    m: Medium;
    t: Tiny;
}

contract ManyLevels {
    field: Large;

    init() {
        self.field = Large{
            m: Medium{
                a: Tiny{ a: 1 },
                b: Tiny{ a: 2 }
            },
            t: Tiny{ a: 3 }
        };
    }
}