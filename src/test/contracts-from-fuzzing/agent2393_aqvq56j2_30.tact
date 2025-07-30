// Mix init default
contract DefaultsMix {
    a: Int = 2;
    b: Bool;
    c: String = "hello";
    d: Int?;
    e: Bool? = false;
    f: String?;
    init() {
        self.b = true;
        self.d = null;
        self.f = "x";
    }
}
