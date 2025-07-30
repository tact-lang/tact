struct InnerMost {
    x: Int;
}

struct Middle {
    i1: InnerMost?;
    i2: InnerMost?;
}

struct Container {
    m: Middle?;
}

contract NestedOptionalsTest {
    data: Container;

    init() {
        self.data = Container{ m: null };
    }
}