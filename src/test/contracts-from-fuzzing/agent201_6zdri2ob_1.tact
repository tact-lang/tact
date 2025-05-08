struct Deep {
    d1: Int;
    d2: Bool;
    d3: String;
}

struct Mid {
    m1: Int;
    m2: Deep;
}

struct Top {
    t1: Bool;
    t2: Mid;
}

contract DeepNestedTest {
    val: Top;

    init() {
        self.val = Top{
            t1: true,
            t2: Mid{
                m1: 7,
                m2: Deep{
                    d1: 42,
                    d2: false,
                    d3: "nested"
                }
            }
        };
    }
}
