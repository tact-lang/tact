contract CrossInit {
    a: Int;
    b: Int;

    init() {
        self.a = 5;
        self.b = self.a + 7;
    }
}