struct Small{
    x: Int;
}

struct Mid{
    s1: Small;
    s2: Small;
    s3: Small;
}

struct Big{
    m1: Mid;
    m2: Mid;
}

contract NestedStructRepeats {
    data: Big;

    init() {
        self.data = Big{
            m1: Mid{
                s1: Small{x:1},
                s2: Small{x:2},
                s3: Small{x:3}
            },
            m2: Mid{
                s1: Small{x:4},
                s2: Small{x:5},
                s3: Small{x:6}
            }
        };
    }
}