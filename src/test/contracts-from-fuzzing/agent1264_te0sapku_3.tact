struct Inner {
    x: Int;
    y: Bool?;
    c: Cell?;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DeepNestedTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            first: Inner{x: 10, y: null, c: null},
            second: Inner{x: 20, y: true, c: null}
        };
    }
}
