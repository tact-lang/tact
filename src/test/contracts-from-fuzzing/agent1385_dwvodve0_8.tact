struct NestedOptionalDefault {
    x: Int? = null;
    y: Bool? = null;
}

contract TestContract {
    state: NestedOptionalDefault;

    init() {
        self.state = NestedOptionalDefault{};
    }
}