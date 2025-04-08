contract MixFieldKinds {
    a: Int = 5;
    b: Bool;
    c: String?;

    init() {
        self.b = true;
        self.c = null;
    }
}
