contract OptNestedPersistence {
    f: Int?;
    g: Bool?;

    init() {
        self.f = null;
        self.g = true;
    }

    receive() {
        if (self.f == null) {
            self.f = 42;
        } else {
            self.f = null;
        }
    }
}