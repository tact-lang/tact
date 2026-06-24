contract NonNullDefaults {
    a: Int? = 5;
    b: Bool? = true;
    c: String? = "abc";

    init() {
        self.a = 77;
        self.b = false;
        self.c = "def";
    }
}