struct Nested {
    in1: Int;
    in2: Bool;
    deeper: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            in1: 42,
            in2: false,
            deeper: Inner{ a: 7, b: true }
        };
    }
}