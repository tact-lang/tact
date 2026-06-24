struct Nested {
    val1: Int;
    val2: Int?;
    sub: Inner;
}

struct Inner {
    val3: Int;
}

contract NestedStructStorage {
    nested: Nested;

    init() {
        self.nested = Nested{
            val1: 1,
            val2: null,
            sub: Inner{ val3: 3 },
        };
    }
}