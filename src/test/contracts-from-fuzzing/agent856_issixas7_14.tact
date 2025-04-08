struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

contract OptStructFieldsAgain {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            a: null,
            b: null
        };
    }
}