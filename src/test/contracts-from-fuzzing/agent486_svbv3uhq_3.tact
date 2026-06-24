struct OptionalNested {
    data: Int?;
}

contract OptStruct {
    optionalField: OptionalNested;

    init() {
        self.optionalField = OptionalNested{ data: null };
    }
}