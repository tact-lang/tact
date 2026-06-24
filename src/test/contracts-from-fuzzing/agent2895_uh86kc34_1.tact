struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructContract {
    s: Outer;

    init() {
        self.s = Outer{
            nested: Inner{ a: 1, b: true },
            flag: false
        };
    }
}
