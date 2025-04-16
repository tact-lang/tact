struct DeepInner {
    name: String?;
}

struct Middle {
    inner: DeepInner?;
}

struct Outer {
    middle: Middle?;
}

contract NullNestedTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            middle: null
        };
    }
}