struct NestedOptional {
    field1: Int?;
    field2: String?;
    field3: Bool?;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            field1: null,
            field2: null,
            field3: null
        };
    }
}