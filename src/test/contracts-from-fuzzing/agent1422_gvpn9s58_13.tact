struct NullableInner {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    x: Int;
    y: NullableInner;
    z: NullableInner?;
}

contract NestedOptionTest {
    data: Container;
    init() {
        self.data = Container{
            x:0,
            y: NullableInner{ foo: null, bar: true },
            z: null
        };
    }
}