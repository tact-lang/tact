struct Tiny {
    f: Int;
}

struct Medium {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    t4: Tiny;
    t5: Tiny;
}

struct Bigger {
    m1: Medium;
    m2: Medium;
}

contract MultiSizeCompose {
    store: Bigger;

    init() {
        self.store = Bigger{
            m1: Medium{
                t1: Tiny{f:1}, t2: Tiny{f:2}, t3: Tiny{f:3}, t4: Tiny{f:4}, t5: Tiny{f:5}
            },
            m2: Medium{
                t1: Tiny{f:6}, t2: Tiny{f:7}, t3: Tiny{f:8}, t4: Tiny{f:9}, t5: Tiny{f:10}
            }
        };
    }
}
