struct Inner {
    val: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract StructGroup {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: Inner{val: 1},
            b: Inner{val: 2},
            c: Inner{val: 3},
            d: Inner{val: 4},
        };
    }
}