struct OptionalDefaults {
    opt1: Int?;
    opt2: Bool?;
}

contract OptionalDefaultInit {
    field: OptionalDefaults;

    init() {
        self.field = OptionalDefaults{};
    }
}