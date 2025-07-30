struct Inner {
    value: Int;
}

struct Parent {
    val1: Int;
    val2: Int;
    nested1: Inner;
    nested2: Inner;
}

contract TestContract {
    s: Parent;

    init() {
        self.s = Parent{
            val1: 1,
            val2: 2,
            nested1: Inner{ value: 100 },
            nested2: Inner{ value: 200 }
        };
    }
}