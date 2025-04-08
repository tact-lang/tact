struct OptionalStringDefaulted {
    val: String? = null;
}

contract OptionalDefaults {
    data: OptionalStringDefaulted;

    init() {
        self.data = OptionalStringDefaulted{};
    }
}
