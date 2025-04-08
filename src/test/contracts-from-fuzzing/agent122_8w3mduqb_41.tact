struct Tiny {
    t: Int as int2;
}

struct Mid {
    m: Tiny;
    f: Bool;
}

struct Top {
    big: Int;
    nested: Mid;
}

contract TinyNested {
    state: Top = Top{
        big: 1000000,
        nested: Mid{
            m: Tiny{ t: 1 },
            f: true
        }
    };

    init() {
        self.state = Top{
            big: -1000000,
            nested: Mid{
                m: Tiny{ t: 5 },   // overflow expected at runtime
                f: false
            }
        };
    }
}
