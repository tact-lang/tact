contract OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;

    init() {
        // override defaults
        self.x = 5;
        self.y = true;
        self.s = "set";
    }
}