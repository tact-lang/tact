// test mix of nested structs and primitives side by side
struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    in1: Inner;
    b: String;
    in2: Inner;
}

contract MixedNestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            a: 5,
            in1: Inner{ x: 1, y: true },
            b: "test",
            in2: Inner{ x: 2, y: false }
        };
    }
}