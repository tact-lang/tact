struct OptionalStruct {
    maybeVal: Int?;
    maybeNested: Nested?;
}

struct Nested {
    flag: Bool;
}

contract TestOptionalStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            maybeVal: null,
            maybeNested: null
        };
    }
}
