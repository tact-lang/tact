struct NestedDefault {
    value: Int = 123;
}

contract TestContract {
    nested: NestedDefault;

    init() {
        self.nested = NestedDefault{};
    }
}