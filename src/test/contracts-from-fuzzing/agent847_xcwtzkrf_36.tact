contract InitDefaultsOptional {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";

    init() {
        self.b = null;
    }
}