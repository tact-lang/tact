struct DeepInner {
    x: Int;
    y: Bool;
}

struct DeepOuter {
    foo: Int;
    bar: Bool;
    inner: DeepInner;
}

contract NestedStructTest {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{
            foo: 1,
            bar: true,
            inner: DeepInner{
                x: 10,
                y: false,
            }
        };
    }
}
