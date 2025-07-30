contract OptionalsDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool? = false;
    d: String? = "text";

    init() {
        self.a = null;
    }
}