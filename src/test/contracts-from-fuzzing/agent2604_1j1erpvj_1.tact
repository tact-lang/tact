struct NestedOptionals {
    field1: Int?;
    field2: String?;
    field3: Bool?;
    field4: Cell?;
    field5: Slice?;
}

contract StorageTest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            field1: 1,
            field2: "string",
            field3: true,
            field4: emptyCell(),
            field5: emptyCell().asSlice(),
        };
    }
}