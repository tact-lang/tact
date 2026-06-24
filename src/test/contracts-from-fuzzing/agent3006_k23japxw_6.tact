struct OptionalNestedFields {
    nestedOptional: Int?;
    flag: Bool;
}

contract OptionalTopLevel {
    maybeStorage: OptionalNestedFields?;

    init() {
        self.maybeStorage = OptionalNestedFields{
            nestedOptional: null,
            flag: true,
        };
    }
}
