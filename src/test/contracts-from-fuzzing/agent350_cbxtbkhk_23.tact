struct SOpt {
    foo: Int?;
}

struct Container {
    bar: SOpt?;
}

contract NestedOptionalsTest {
    data: Container;

    init() {
        self.data = Container{
            bar: SOpt{ foo: 17 }
        };
    }
}