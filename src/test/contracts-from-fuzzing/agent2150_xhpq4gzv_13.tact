struct HasNullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    field: HasNullDefaults;

    init() {
        self.field = HasNullDefaults{};
    }
}