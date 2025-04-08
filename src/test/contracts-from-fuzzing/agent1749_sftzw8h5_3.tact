struct Deep {
    d1: Int;
    d2: Bool;
}

struct Middle {
    m1: Deep;
    m2: Int?;
}

struct Top {
    t1: Middle;
    t2: String;
}

contract DeepNestTest {
    field: Top;

    init() {
        self.field = Top{
            t1: Middle{
                m1: Deep{
                    d1: 1,
                    d2: true,
                },
                m2: null,
            },
            t2: "top",
        };
    }
}