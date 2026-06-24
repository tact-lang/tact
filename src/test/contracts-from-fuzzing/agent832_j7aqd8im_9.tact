contract NoDefaults {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "abc";
    }

    receive() {
        let _ = self.c;
    }
}