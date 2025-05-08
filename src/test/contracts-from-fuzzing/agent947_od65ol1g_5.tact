struct Inner {
    x: Int?;
}

struct Mid {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Mid{ i1: Inner{ x:null }, i2: Inner{ x:1 } },
            m2: Mid{ i1: Inner{ x:2 }, i2: Inner{ x:null } },
        };
    }
}