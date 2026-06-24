contract OptionalStringDefaults {
    a: String? = null;
    b: String? = "";
    c: String = "nonopt";

    init() {
        self.a = "x";
        self.b = null;
        self.c = "y";
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}