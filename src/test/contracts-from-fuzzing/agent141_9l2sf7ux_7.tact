struct MultiOptDefaults {
    a: Int = 1;
    b: Bool?;
    c: String? = "hello";
    d: Int?;
    e: Bool = false;
}

contract CombinedDefaults {
    field: MultiOptDefaults;

    init() {
        self.field = MultiOptDefaults{};
    }
}