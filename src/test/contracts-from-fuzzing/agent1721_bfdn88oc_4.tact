struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptionalNestedTest {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{ inner: null };
    }
}
