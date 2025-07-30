contract MixDefaultInit {
    a: Int = 5;
    b: Int;

    init() {
        self.b = self.a + 10;
    }
}