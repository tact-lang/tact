contract BoolOptSerialize {
    b1: Bool;
    b2: Bool?;

    init() {
        self.b1 = true;
        self.b2 = null;
    }
}