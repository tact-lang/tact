contract MixedInit {
    a: Int = 1;
    b: Int;
    c: Bool = true;
    d: Bool;
    e: String = "hi";
    f: String?;

    init() {
        self.b = 2;
        self.d = false;
        self.f = null;
    }
}