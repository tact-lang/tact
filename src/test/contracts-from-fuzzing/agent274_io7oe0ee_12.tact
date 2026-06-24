struct OptionalNestedStruct {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract OptNestedStructTest {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            inner: Inner{
                a: 42,
                b: null,
            },
        };
    }

    receive() {}
}
