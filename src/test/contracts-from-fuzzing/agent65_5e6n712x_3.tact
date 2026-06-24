struct OptionalNested {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Address?;
    field5: Cell?;
    field6: Slice?;
    field7: Builder?;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            field1: null,
            field2: true,
            field3: null,
            field4: null,
            field5: emptyCell(),
            field6: null,
            field7: null
        };
    }
}
