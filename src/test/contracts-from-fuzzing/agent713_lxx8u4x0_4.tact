struct Inner {
    x: Int;
}

struct Outer {
    y: Inner?;
}

contract OptionalNestedTest {
    item: Outer;

    init() {
        self.item = Outer{
            y: null
        };
    }
}