contract Test {
    a: Int = 5;
    b: Int;
    c: Bool?;
    d: String?;

    init() {
        self.b = 42;
        // optional fields untouched => null
    }

    receive() {}
}