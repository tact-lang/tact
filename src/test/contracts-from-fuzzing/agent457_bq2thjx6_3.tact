struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract Test {
    storage: Outer;
    init() {
        self.storage = Outer{
            first: Inner{ x: 1, y: "hello" },
            second: Inner{ x: 2, y: "world" },
        };
    }
}