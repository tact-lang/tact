struct OptionalNested {
    field1: Int?;
    field2: String?;
    field3: Bool?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            field1: null,
            field2: null,
            field3: null
        };
    }
}