struct OptionalDefault {
    a: Int? = null;
    b: String? = null;
}

contract Test {
    data: OptionalDefault;
    init() {
        self.data = OptionalDefault{};
    }
}