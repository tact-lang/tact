struct NestedOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            field1: null,
            field2: true,
            field3: "hello"
        };
    }
}