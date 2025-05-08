struct Bottom {
    a: Int as uint8 = 0;
    b: String? = null;
    c: Bool = true;
}

struct Middle {
    m1: Bottom?;
    m2: Bottom;
}

struct Top {
    t1: Middle?;
    t2: Middle;
}

contract Test {
    deep: Top;

    init() {
        self.deep = Top{
            t1: null,
            t2: Middle{
                m1: null,
                m2: Bottom{ a: 5, b: "hi", c: false }
            }
        };
    }
}