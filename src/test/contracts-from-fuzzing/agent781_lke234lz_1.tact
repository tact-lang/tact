struct NestedInner {
    a: Int = 1;
    b: Bool = true;
}

struct NestedOuter {
    x: Int = 5;
    y: NestedInner;
}

contract DeepNestedTest {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            x: 42,
            y: NestedInner{
                a: 999,
                b: false,
            },
        };
    }
}