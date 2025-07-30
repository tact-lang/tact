contract OnlyStrings {
    a: String;
    b: String?;
    c: String;

    init() {
        self.a = "one";
        self.b = null;
        self.c = "two";
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}
