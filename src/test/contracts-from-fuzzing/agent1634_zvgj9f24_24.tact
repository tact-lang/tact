struct SOptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract StructOptDefaults {
    x: SOptionalDefaults;

    init() {
        self.x = SOptionalDefaults{};
    }
}