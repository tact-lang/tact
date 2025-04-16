contract InitPartial {
    a: Int;
    b: Bool;
    c: String = "hi";

    init() {
        self.a = 42;
        self.b = false;
    }

    receive() {
        let _ = self.b;
    }
}