contract InitDefaults {
    intField: Int = 0;
    boolField: Bool = false;
    optString: String?;

    init() {
        self.intField = 55;
        self.boolField = true;
        self.optString = "hi";
    }
}