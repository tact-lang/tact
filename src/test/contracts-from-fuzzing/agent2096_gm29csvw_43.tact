contract MixInits {
    a: Int;
    b: Int = 2;
    c: Bool?;
    d: Bool? = null;

    init() {
        self.a = 1;
        self.c = null;
    }
}