struct ManyOptionals {
    field1: Int?;
    field2: Bool?;
    field3: Address?;
    field4: Cell?;
    field5: Slice?;
    field6: String?;
}

contract OptionalFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            field1: null,
            field2: null,
            field3: null,
            field4: null,
            field5: null,
            field6: null
        };
    }
}