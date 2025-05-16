contract NoDefaultsMustInit {
    f1: Int;
    f2: Bool;
    f3: String;

    init() {
        self.f1 = 42;
        self.f2 = true;
        self.f3 = "data";
    }
}