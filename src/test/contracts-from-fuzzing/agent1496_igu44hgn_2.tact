struct Nested {
    val1: Int;
    nested2: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{
            val1: 5,
            nested2: Inner{ a: 7, b: true }
        };
    }
}