struct Inner {
    innerField: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ innerField: 1 },
            nested2: Inner{ innerField: 2 },
            nested3: Inner{ innerField: 3 },
        };
    }
}