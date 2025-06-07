struct OptionalNestedStruct {
    x: Int?;
    str: String?;
    inner: AnotherStruct?;
}

struct AnotherStruct {
    y: Int;
    flag: Bool;
}

contract OptStructTest {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            x: null,
            str: null,
            inner: null
        };
    }
}