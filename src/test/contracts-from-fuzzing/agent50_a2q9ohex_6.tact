struct OptionalNested {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInner: InnerStruct{value: 99, flag: true}
        };
    }
}