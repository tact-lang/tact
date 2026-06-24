contract OptFieldsWithDefault {
    x: Int? = null;
    y: Bool? = true;
    s: String? = null;

    init() {
        self.x = 5;
        self.y = false;
        self.s = "hi";
    }
}