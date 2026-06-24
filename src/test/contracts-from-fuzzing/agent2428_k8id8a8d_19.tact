contract MixInitDefault {
    a: Int = 1;
    b: Bool;

    init() {
        self.b = true;
        self.a = 42;
    }
}