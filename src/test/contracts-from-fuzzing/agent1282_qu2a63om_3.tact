struct OptionalNest {
    note: String?;
    number: Int?;
}

contract OptionalNestedStruct {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            note: null,
            number: null,
        };
    }
}
