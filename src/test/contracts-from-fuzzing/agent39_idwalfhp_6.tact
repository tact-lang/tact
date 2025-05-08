struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract NestedOptionals {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            x: 77,
            y: null,
        };
    }
}