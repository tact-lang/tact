struct NestedOptionals {
    maybeInt: Int?;
    maybeStr: String?;
    maybeBool: Bool?;
}

contract LayeredOptional {
    foo: NestedOptionals;
    init() {
        self.foo = NestedOptionals{
            maybeInt: null,
            maybeStr: null,
            maybeBool: null
        };
    }
}