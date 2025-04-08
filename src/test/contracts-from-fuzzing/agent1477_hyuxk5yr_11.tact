contract StringPersistence {
    s1: String;
    s2: String?;
    s3: String = "Hello";
    s4: String? = null;

    init() {
        self.s1 = "World";
        self.s2 = null;
        self.s3 = "Changed";
        self.s4 = "Nullable";
    }
}