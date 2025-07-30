struct DeepNested {
    level: Int;
    nested: Nested;
}

struct Nested {
    val1: Int;
    val2: Bool;
    sub: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level: 3,
            nested: Nested{
                val1: 1,
                val2: false,
                sub: Inner{ a: 7, b: true }
            }
        };
    }
}