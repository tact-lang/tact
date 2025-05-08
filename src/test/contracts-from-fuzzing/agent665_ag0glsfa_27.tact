contract OptionalStrings {
    a: String? = null;
    b: String? = "";

    init() {
        self.a = "foo";
        self.b = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
    }
}