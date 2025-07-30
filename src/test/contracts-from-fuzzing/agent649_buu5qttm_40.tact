contract MixedDefaults {
    a: Int = 7;
    b: Bool;
    c: Int;
    init() {
        self.b = true;
        self.c = 42;
    }
    receive() {
        let _ = self.c;
    }
}