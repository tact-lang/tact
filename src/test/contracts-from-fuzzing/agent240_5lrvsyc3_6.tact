struct NestedOptional {
    innerOpt: Bool?;
    another: Int?;
}

struct HasOptionalStruct {
    nested: NestedOptional?;
    value: Int;
}

contract OptionalNestedStructContract {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{
            nested: null,
            value: 123,
        };
    }
}