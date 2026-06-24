struct Inner {
    value: Int;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{ i1: Inner{value:1}, i2: Inner{value:2} },
            m2: Middle{ i1: Inner{value:3}, i2: Inner{value:4} }
        };
    }
}