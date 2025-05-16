contract ComplexInlineInit {
    a: Int = 7;
    b: Bool = true;
    c: String = "init";
    init() {
        self.a = 77;
        self.b = false;
        self.c = "override";
    }
}