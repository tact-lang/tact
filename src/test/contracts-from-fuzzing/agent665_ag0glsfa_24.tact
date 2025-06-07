contract OptionalFieldDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}