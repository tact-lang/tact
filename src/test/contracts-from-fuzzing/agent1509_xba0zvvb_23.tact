contract DefaultAndNoDefault {
    a: Int;                // no default
    b: Bool = false;      // with default
    c: String;            // no default
    d: String = "hi";    // with default

    init() {
        self.a = 7;
        self.c = "filled";
    }

    receive() {
        let _ = self.a + ( (self.b) ? 1 : 0 );
    }
}