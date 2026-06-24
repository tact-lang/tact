struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract VeryDeepNested {
    val: Outer;

    init() {
        self.val = Outer{
            mid1: Middle{
                inner1: Inner{ x: 1, y: 2 },
                inner2: Inner{ x: 3, y: 4 }
            },
            mid2: Middle{
                inner1: Inner{ x: 5, y: 6 },
                inner2: Inner{ x: 7, y: 8 }
            }
        };
    }
}