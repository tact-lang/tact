contract OptionalBoolAndInt {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 42;
        self.b = true;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
    }
}