contract MixedInit {
    a: Int = 1;
    b: Int;
    c: Int?;
    init() {
        self.b = 2;
        self.c = null;
    }
}