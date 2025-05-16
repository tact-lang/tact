contract InitWithoutDefaults {
    a: Int;
    b: Bool;
    s: String;

    init() {
        self.a = 7;
        self.b = true;
        self.s = "foo";
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.s;
    }
}