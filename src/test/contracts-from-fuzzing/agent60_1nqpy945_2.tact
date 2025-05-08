struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    value: Int;
    flag2: Bool;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{ x: 1, y: 2, flag: true },
            value: 42,
            flag2: false
        };
    }
}