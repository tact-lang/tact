contract OptDefaults {
    a: Int? = null;
    b: Bool? = true;
    s: String? = "abc";

    init() {
        self.a = 1;
        self.b = false;
        self.s = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.s;
    }
}