contract MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "ok";
    d: Bool;
    e: Int;

    init() {
        self.b = true;
        self.d = false;
        self.e = 5;
    }
}