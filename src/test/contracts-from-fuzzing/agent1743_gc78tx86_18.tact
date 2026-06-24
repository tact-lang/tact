struct NestedDefaults {
    field1: Int = 10;
    field2: InnerWithDefaults;
}

struct InnerWithDefaults {
    innerField1: Int = 42;
    innerField2: String = "hello";
}

contract DefaultsDeep {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            field2: InnerWithDefaults{
                innerField1: 100,
                innerField2: "world",
            },
        };
    }
}