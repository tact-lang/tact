struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    n1: Nested;
    n2: Nested?;
    s: String;
}

contract DeepNest {
    item: Outer;

    init() {
        self.item = Outer{
            n1: Nested{ a: 5, b: true },
            n2: null,
            s: "hello"
        };
    }
}
