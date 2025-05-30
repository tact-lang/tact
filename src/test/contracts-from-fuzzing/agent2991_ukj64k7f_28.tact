contract Test {
    s: String = "hello";
    s_opt: String? = null;

    init() {
        self.s = "world";
        self.s_opt = "!";
    }
}