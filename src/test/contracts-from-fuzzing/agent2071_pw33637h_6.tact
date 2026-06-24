struct OptNestedStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract OptionalNestedStructTest {
    data: OptNestedStruct;

    init() {
        self.data = OptNestedStruct {
            nested: InnerStruct {
                flag: false,
                count: 123,
            },
        };
    }
}