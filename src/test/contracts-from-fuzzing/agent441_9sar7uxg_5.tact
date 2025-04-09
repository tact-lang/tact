struct InnerMost {
    x: Int;
}

struct Inner {
    val: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    val: InnerMost{ x: 999 },
                },
            },
        };
    }
}