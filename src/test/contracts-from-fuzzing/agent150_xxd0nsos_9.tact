struct Tiny {
    a: Int;
}

struct Small {
    t1: Tiny;
    t2: Tiny;
}

struct Medium {
    s1: Small;
    s2: Small;
}

struct Large {
    m1: Medium;
    m2: Medium;
}

contract DeepWideNested {
    field: Large;

    init() {
        self.field = Large{
            m1: Medium{
                s1: Small{
                    t1: Tiny{a:1},
                    t2: Tiny{a:2}
                },
                s2: Small{
                    t1: Tiny{a:3},
                    t2: Tiny{a:4}
                }
            },
            m2: Medium{
                s1: Small{
                    t1: Tiny{a:5},
                    t2: Tiny{a:6}
                },
                s2: Small{
                    t1: Tiny{a:7},
                    t2: Tiny{a:8}
                }
            }
        };
    }
}