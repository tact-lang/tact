contract OptionalWithDefaults {
    a: Int? = null;
    b: String? = null;
    flag: Bool = false;
    init() {
        self.a = null;
        self.b = "hi";
        self.flag = true;
    }
}