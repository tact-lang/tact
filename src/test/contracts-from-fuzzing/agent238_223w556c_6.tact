struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner1: Inner?;
    inner2: Inner?;
}

contract DoubleOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: null,
            inner2: Inner{a: 5, b: false}
        };
    }
}