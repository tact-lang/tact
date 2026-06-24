struct OptionalDefaults {
    optInt: Int?;
    optStr: String?;
    optCell: Cell?;
}

contract OptDefaults {
    s: OptionalDefaults;

    init() {
        self.s = OptionalDefaults{};
    }
}
