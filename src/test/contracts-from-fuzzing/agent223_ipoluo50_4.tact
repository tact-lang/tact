struct OptionalNestedStruct {
    nested: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalStructTest {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            nested: null
        };
    }
}