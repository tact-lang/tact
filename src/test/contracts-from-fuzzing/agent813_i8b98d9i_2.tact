struct Inner1 {
    v1: Int;
    v2: Bool?;
}

struct Inner2 {
    w1: String;
    w2: Int?;
}

struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Top {
    m: Middle;
    flag: Bool;
}

contract DeeplyNested {
    field: Top;

    init() {
        self.field = Top{
            m: Middle{
                i1: Inner1{ v1: 1, v2: false },
                i2: Inner2{ w1: "test", w2: null }
            },
            flag: true
        };
    }
}