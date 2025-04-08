contract InitializeLater {
    a: Int;
    b: Bool;
    c: String;
    init() {
        self.a = 42;
        self.b = false;
        self.c = "foo";
    }
}