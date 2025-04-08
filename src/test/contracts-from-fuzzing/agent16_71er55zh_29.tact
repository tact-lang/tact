struct HasOptionDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract OptDefaults {
    field: HasOptionDefault;

    init() {
        self.field = HasOptionDefault{};
    }
}