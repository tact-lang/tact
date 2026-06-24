struct NestedOptionals {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            field1: null,
            field2: true,
            field3: "hello",
        };
    }
}