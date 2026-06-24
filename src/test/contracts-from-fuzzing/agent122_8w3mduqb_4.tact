struct InnerDeep {
    d1: Int;
    d2: Bool?;
}

struct Middle {
    m1: InnerDeep;
    m2: Int?;
}

struct Outer {
    o1: Middle;
    o2: Bool;
}

contract MultiNested {
    persist: Outer = Outer{
        o1: Middle{
            m1: InnerDeep{
                d1: 0,
                d2: null,
            },
            m2: null,
        },
        o2: false,
    };

    init() {
        self.persist = Outer{
            o1: Middle{
                m1: InnerDeep{
                    d1: 1,
                    d2: true,
                },
                m2: 2,
            },
            o2: true,
        };
    }
}
