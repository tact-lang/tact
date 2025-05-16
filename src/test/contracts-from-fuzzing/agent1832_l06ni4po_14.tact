contract DefaultsAndNoDefaults {
    a: Int = 0;
    b: String; // no default
    c: Bool = false;

    init() {
        self.b = "test";
    }
}
