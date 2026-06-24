contract DefaultsAndNoDefaults {
    a: Int;
    b: Bool = true;
    c: String;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "hello";
    }
}
