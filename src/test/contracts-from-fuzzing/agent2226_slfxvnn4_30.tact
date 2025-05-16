struct One {
    val: Int;
}

struct Two {
    a: One;
    b: One;
}

struct Three {
    c: Two;
    d: Two;
}

struct Four {
    e: Three;
    f: Three;
}

contract DeepWide {
    nest: Four;
    init() {
        self.nest = Four{
            e: Three{
                c: Two{ a: One{val:1}, b: One{val:2} },
                d: Two{ a: One{val:3}, b: One{val:4} }
            },
            f: Three{
                c: Two{ a: One{val:5}, b: One{val:6} },
                d: Two{ a: One{val:7}, b: One{val:8} }
            }
        };
    }
}