struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
    z: InnerMost;
}

struct Outer {
    id: Int;
    name: String;
    inner: Inner;
}

contract DeepNestedStructTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            id: 1,
            name: "test",
            inner: Inner{
                x: 2,
                y: true,
                z: InnerMost{
                    a: 3,
                    b: false
                }
            }
        };
    }
}
