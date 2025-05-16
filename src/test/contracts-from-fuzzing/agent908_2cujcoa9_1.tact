struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ a: 1, b: true },
            flag: false
        };
    }
}
