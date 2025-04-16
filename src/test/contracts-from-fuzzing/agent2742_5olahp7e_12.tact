struct NestedStructWithDefaults {
    intField: Int = 1;
    boolField: Bool = true;
}

struct WrapperStruct {
    wrapped: NestedStructWithDefaults;
    someInt: Int;
}

contract WrapDefaults {
    data: WrapperStruct;

    init() {
        self.data = WrapperStruct{
            wrapped: NestedStructWithDefaults{},
            someInt: 42,
        };
    }
}