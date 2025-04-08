contract NullableDefaults {
    owner: Address? = null;

    init() {
        self.owner = null;
    }
}
