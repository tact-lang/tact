struct OptionalDefaults {
    i: Int?;
    b: Bool?;
}

contract OptionalDefaultsHolder {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}