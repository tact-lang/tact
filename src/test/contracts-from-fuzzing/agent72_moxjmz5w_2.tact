struct Nested {
    level1: Int;
    level2: Int?;
    deeper: Inner;
}

struct Inner {
    flag: Bool;
    val: Int?;
}

contract DeepTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            level1: 5,
            level2: null,
            deeper: Inner{ flag: true, val: null }
        };
    }
}