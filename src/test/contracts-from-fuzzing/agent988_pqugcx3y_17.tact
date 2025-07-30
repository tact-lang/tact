contract InlineInit {
    f: Int;
    g: Bool;
    h: String;

    init() {
        self.f = 42;
        self.g = true;
        self.h = "test";
    }
}