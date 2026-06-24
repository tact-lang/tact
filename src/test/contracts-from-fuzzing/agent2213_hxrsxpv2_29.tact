struct Outer {
    a: Inner?;
    b: Inner?;
}

struct Inner {
    val: Int?;
}

contract DoubleOpt {
    d: Outer;

    init() {
        self.d = Outer{
            a: null,
            b: Inner{ val: null },
        };
    }
}
