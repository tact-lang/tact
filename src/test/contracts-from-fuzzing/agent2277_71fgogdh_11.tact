struct OptionalNest {
    inner: Int?;
}

struct Outer {
    nested: OptionalNest?;
}

contract NestedOptionalsTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null
        };
    }
}
