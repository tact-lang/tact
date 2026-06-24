struct ManyOptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract Test {
    v: ManyOptionalDefaults;

    init() {
        self.v = ManyOptionalDefaults{};
    }
}