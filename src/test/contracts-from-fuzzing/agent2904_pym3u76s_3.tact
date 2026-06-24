struct NestedOptionalStruct {
    innerInt: Int;
    optBool: Bool?;
}

struct ComplexOptionalContainer {
    s_internal: String;
    nested: NestedOptionalStruct?;
    flag: Bool?;
}

contract OptionalNestedStructContract {
    data: ComplexOptionalContainer;

    init() {
        self.data = ComplexOptionalContainer{
            s_internal: "hi",
            nested: NestedOptionalStruct{
                innerInt: 7,
                optBool: false,
            },
            flag: true,
        };
    }
}