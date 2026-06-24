struct MultipleOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Cell?;
}

contract OptionalStorage {
    data: MultipleOptional;

    init() {
        self.data = MultipleOptional{
            field1: null,
            field2: null,
            field3: null,
            field4: null
        };
    }
}
