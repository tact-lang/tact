struct Small {
    a: Int;
    b: Int;
}

struct Medium {
    s1: Small;
    s2: Small;
}

struct Large {
    m1: Medium;
    m2: Medium;
}

contract NestedLarge {
    field: Large;

    init() {
        self.field = Large{
            m1: Medium{
                s1: Small{ a: 1, b: 2 },
                s2: Small{ a: 3, b: 4 }
            },
            m2: Medium{
                s1: Small{ a: 5, b: 6 },
                s2: Small{ a: 7, b: 8 }
            }
        };
    }
}