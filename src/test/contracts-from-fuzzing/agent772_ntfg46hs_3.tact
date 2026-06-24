struct Inner {
    value1: Int;
    value2: Bool;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ value1: 1, value2: true },
            nested2: Inner{ value1: 2, value2: false },
            flag: true,
        };
    }
}