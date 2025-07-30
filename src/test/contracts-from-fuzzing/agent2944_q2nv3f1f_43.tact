contract NoDefaultsOptionals {
    first: Int?;
    second: Bool?;

    init() {
        self.first = null;
        self.second = true;
    }
}