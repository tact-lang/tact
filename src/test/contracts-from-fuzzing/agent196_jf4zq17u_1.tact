struct InnerNested {
    x: Int;
    y: Int?;
}

struct Nested {
    a: Bool;
    b: InnerNested;
}

contract DeepNestedTest {
    val: Nested;

    init() {
        self.val = Nested{
            a: true,
            b: InnerNested{
                x: 42,
                y: null,
            },
        };
    }
}