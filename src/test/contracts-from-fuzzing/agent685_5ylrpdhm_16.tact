contract DefaultsAndNonDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "abc";

    init() {
        self.b = true;
    }
}