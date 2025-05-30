contract MixDefaultsInit {
    a: Int = 10;
    b: Bool;
    c: String = "hi";

    init() {
        self.b = true;
    }
}