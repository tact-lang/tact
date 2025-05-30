struct InnerDefault {
    x: Int = 123;
}

contract NestedDefaultField {
    nested: InnerDefault;

    init() {
        self.nested = InnerDefault{};
    }
}