struct OptionalNestedStruct {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestOptNestedStruct {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            inner: Inner{
                a: 5,
                b: false
            }
        };
    }
}