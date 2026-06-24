struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedOptionalTest {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            inner: null
        };
    }
}