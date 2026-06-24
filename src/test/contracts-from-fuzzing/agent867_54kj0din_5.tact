struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    nested: Outer = Outer{
        mid: Middle{
            inner1: Inner{ x: 1, y: null },
            inner2: null
        }
    };

    init() {
        self.nested = Outer{
            mid: Middle{
                inner1: Inner{ x: 42, y: true },
                inner2: Inner{ x: 100, y: false }
            }
        };
    }
}
