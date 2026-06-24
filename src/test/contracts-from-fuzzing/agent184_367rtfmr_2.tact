struct Inner {
    f1: Int;
    f2: Bool;
}

struct Outer {
    s: Inner;
    value: Int;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            s: Inner{
                f1: 1,
                f2: true,
            },
            value: 10,
        };
    }
}