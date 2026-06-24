struct OptionalDefault {
    num: Int? = null;
    string: String? = null;
}

contract OptionalAssigned {
    field: OptionalDefault;

    init() {
        self.field = OptionalDefault{};
    }
}
