struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DeepNestedTest {
    state: Outer;

    init() {
        self.state = Outer{
            first: Inner{x: 1, y: null},
            second: Inner{x: 2, y: 3}
        };
    }
}