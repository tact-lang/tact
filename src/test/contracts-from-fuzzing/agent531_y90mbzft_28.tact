struct OptionalDefaults {
    x: Int?;
    y: Bool?;
}

contract NullDefaults {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}