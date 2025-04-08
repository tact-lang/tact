struct NestedOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    param1: NestedOptional;

    init() {
        self.param1 = NestedOptional{
            field1: null,
            field2: true,
            field3: null
        };
    }
}