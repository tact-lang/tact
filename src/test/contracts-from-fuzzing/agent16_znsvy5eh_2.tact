struct SubNested {
    x: Int;
    y: Bool;
}

struct Nested {
    alpha: Int;
    beta: SubNested;
}

contract MultiNestedTest {
    inner: Nested;

    init() {
        self.inner = Nested{
            alpha: 1,
            beta: SubNested{
                x: 2,
                y: true,
            },
        };
    }
}