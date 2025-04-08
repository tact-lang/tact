struct NestedOptionals {
    innerBool: Bool?;
    innerInt: Int?;
}

contract TestNestedOptionals {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{};
    }
}