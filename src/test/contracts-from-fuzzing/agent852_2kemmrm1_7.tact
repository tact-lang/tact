struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: String;
    y: Inner;
}

contract NestedStructs {
    data: Outer = Outer{
        x: "hello",
        y: Inner{a: 1, b: true}
    };

    init() {
        self.data = Outer{ x: "world", y: Inner{ a: 42, b: false } };
    }

    receive() {}
}