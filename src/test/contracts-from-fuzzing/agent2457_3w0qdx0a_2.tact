struct Deep {
    a: Int;
    b: Bool;
}

struct Middle {
    d: Deep;
    e: Int;
}

struct OuterMost {
    m: Middle;
    f: Bool;
}

contract DeepNestedStructTest {
    info: OuterMost;

    init() {
        self.info = OuterMost{
            m: Middle{
                d: Deep{a: 2, b: false},
                e: 3
            },
            f: true
        };
    }
}