struct OptionalDefault {
    val: Int? = null;
    note: String? = null;
    status: Bool? = null;
}

contract OptionalInit {
    defaults: OptionalDefault;

    init() {
        self.defaults = OptionalDefault{};
    }
}