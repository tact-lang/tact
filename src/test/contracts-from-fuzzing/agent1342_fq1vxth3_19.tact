struct Inner {
    foo: Int;
    bar: String;
}

struct Outer {
    left: Inner;
    right: Inner;
}

contract NestedTwice {
    storage: Outer;

    init() {
        self.storage = Outer{
            left: Inner{ foo: 1, bar: "A" },
            right: Inner{ foo: 2, bar: "B" }
        };
    }
}