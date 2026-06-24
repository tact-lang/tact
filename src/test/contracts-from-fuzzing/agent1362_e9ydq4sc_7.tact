contract Test {
    a: String? = null;
    b: String? = "hello";
    init() {
        self.a = "foo";
        self.b = null;
    }
    receive() {}
}