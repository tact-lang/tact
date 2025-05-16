struct Inner {
    x: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract NestedSameStruct {
    store: Outer;

    init() {
        self.store = Outer {
            a: Inner{ x: 1 },
            b: Inner{ x: 2 },
            c: Inner{ x: 3 }
        };
    }
}