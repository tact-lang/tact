struct Inner {
    a: Int;
}

struct Outer {
    b: Inner;
}

contract DoubleNest {
    field: Outer;

    init() {
        self.field = Outer{
            b: Inner{
                a: 777,
            },
        };
    }
}