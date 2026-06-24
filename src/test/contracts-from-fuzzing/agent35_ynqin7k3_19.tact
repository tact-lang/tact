struct InnerDefault {
    a: Int = 1;
    b: Bool = false;
}

contract NestedDefault {
    nested: InnerDefault;

    init() {
        self.nested = InnerDefault{};
    }
}