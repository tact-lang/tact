struct Deep {
    u: Int = 10;
    v: Bool?;
}

struct Mid {
    d1: Deep;
    d2: Deep?;
}

struct Outer {
    m: Mid;
    optStr: String?;
}

contract DeeplyComposite {
    data: Outer;

    init() {
        self.data = Outer{
            m: Mid{
                d1: Deep{ u: 123, v: null },
                d2: null
            },
            optStr: null
        };
    }
}