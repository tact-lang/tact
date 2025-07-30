struct OptionalStruct {
    optionalField: Int?;
    nested: NestedOpt;
}

struct NestedOpt {
    optionalNestedField: Int?;
}

contract TestContract {
    someData: OptionalStruct;

    init() {
        self.someData = OptionalStruct{
            optionalField: null,
            nested: NestedOpt{
                optionalNestedField: null
            }
        };
    }
}
