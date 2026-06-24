struct MultipleOptionals {
    field1: Int?;
    field2: String?;
    field3: Address?;
    field4: Bool?;
}

contract ManyOptionalFields {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals{
            field1: null,
            field2: "hello",
            field3: null,
            field4: true
        };
    }
}