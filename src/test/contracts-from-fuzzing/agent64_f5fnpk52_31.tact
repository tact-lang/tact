contract OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 5;
    e: Bool = true;
    f: String = "abc";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "zzz";
    }

    receive() {
        self.a = null;
    }
}