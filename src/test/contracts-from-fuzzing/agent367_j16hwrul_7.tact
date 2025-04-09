struct InnerMostL {
    x: Int;
}

struct InnerL {
    s1: InnerMostL;
    s2: InnerMostL;
}

struct MidL {
    x: Int;
    inner: InnerL;
}

struct OuterL {
    level: MidL;
    y: Int;
}

contract MultiDeep {
    storage: OuterL;

    init() {
        self.storage = OuterL{
            level: MidL{
                x: 5,
                inner: InnerL{
                    s1: InnerMostL{x:1},
                    s2: InnerMostL{x:2}
                }
            },
            y:42
        };
    }
}