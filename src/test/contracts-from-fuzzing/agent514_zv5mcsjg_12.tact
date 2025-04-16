contract ProperInit {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "ok";
    }
}