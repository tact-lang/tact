struct NestedOptional {
    optionalInt: Int?;
    optionalBool: Bool?;
}

contract TestContract {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            optionalInt: null,
            optionalBool: true,
        };
    }
}