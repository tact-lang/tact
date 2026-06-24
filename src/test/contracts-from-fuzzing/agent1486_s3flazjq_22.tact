struct Defaults {
    a: Int = 1;
    b: String? = null;
}

contract StructDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
