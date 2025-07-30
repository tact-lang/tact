struct Inner {
    x: Int;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract TestContract {
    value: Outer;

    init() {
        self.value = Outer{
            mid1: Middle{
                inner1: Inner{ x: 1 },
                inner2: Inner{ x: 2 },
                inner3: Inner{ x: 3 }
            },
            mid2: Middle{
                inner1: Inner{ x: 4 },
                inner2: Inner{ x: 5 },
                inner3: Inner{ x: 6 }
            }
        };
    }
}