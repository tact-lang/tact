contract StringDefaults {
    a: String = "";
    b: String = "default";

    init() {
        self.a = "alpha";
        self.b = "beta";
    }
}