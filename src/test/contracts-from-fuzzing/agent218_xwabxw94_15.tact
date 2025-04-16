contract MixedOpts {
    a: Int?; // implicitly null
    b: Bool? = true;
    c: String?;

    init() {
        self.a = 7;
        self.c = null;
    }
}