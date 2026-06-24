contract InlineInitStructFields {
    a: Int = 5;
    b: Bool = false;
    s: String = "default";
    init() {
        self.a = 42;
        self.b = true;
        self.s = "set";
    }
}