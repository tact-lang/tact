struct InnerMost {
    a: Int;
}

struct Inner {
    x: InnerMost?;
}

struct Outer {
    y: Inner?;
}

contract OptionalNestingTest {
    data: Outer;
    init() {
        self.data = Outer{
            y: null
        };
    }
}
