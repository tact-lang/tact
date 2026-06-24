struct InnerMost {
    v: Int;
}

struct Inner {
    x: InnerMost;
}

struct Middle {
    i: Int = 7;
    inner: Inner?;
}

struct Top {
    m: Middle;
}

contract VeryDeep {
    val: Top;

    init() {
        self.val = Top{
            m: Middle{
                i: 42,
                inner: null
            }
        };
    }
}