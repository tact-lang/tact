contract MixedOptionalsPresets {
    a: Int? = null;
    b: Bool = false;
    c: Bool? = null;
    d: String = "";
    e: String? = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = true;
        self.d = "abc";
        self.e = "def";
    }
}