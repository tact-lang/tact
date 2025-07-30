struct InnerMost {
    z: Int?;
}

struct Middle {
    value: InnerMost;
    flag: Bool;
}

struct Outer {
    a: Middle;
    b: Int;
    c: Bool?;
}

contract MultiNest {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: Middle{
                value: InnerMost{ z: null },
                flag: true
            },
            b: 42,
            c: null
        };
    }
}