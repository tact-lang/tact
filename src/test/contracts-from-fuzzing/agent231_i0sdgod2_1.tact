struct NestedOptionals {
    field1: Int?;
    field2: String?;
    field3: Bool?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            field1: null,
            field2: null,
            field3: null,
        };
    }
}