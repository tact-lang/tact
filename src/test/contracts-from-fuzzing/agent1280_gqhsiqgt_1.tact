struct DeepInner {
    value: Int;
}

struct Middle {
    inner: DeepInner?;
}

struct Outer {
    middle: Middle;
}

contract NestedOptionalsTest {
    field: Outer;

    init() {
        self.field = Outer{
            middle: Middle{
                inner: null
            }
        };
    }
}