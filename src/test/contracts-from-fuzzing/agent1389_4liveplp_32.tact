struct OptionalDefault {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract StructOptDefaults {
    field: OptionalDefault;

    init() {
        self.field = OptionalDefault{};
    }
}