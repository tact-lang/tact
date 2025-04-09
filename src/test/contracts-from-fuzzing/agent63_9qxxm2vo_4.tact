struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    foo: Inner;
    bar: String;
}

contract NestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Inner{ x: 1, y: true },
            bar: "hi",
        };
    }
}