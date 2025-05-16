struct Inner {
    x: Int;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            m1: Middle{ i: Inner{ x: 1 } },
            m2: Middle{ i: Inner{ x: 2 } }
        };
    }
}