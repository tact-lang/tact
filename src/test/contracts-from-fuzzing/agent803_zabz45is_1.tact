struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    count: Int;
}

contract NestedStructStorage {
    store: Outer;

    init() {
        self.store = Outer{
            nested: Inner{ val1: 10, val2: true },
            flag: false,
            count: 123
        };
    }
}