struct OptionalNestedStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    v: Int;
    s: String;
}

contract OptNestedTest {
    state: OptionalNestedStruct;

    init() {
        self.state = OptionalNestedStruct{
            nested: InnerStruct{
                v: 9,
                s: "hello"
            }
        };
    }
}