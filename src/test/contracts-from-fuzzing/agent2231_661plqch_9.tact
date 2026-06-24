contract BoolDefaults {
    first: Bool = true;
    second: Bool = false;

    init() {
        self.first = false;
        self.second = true;
    }
}