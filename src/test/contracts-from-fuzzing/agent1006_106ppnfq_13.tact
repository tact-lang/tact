contract DefaultsOverrides {
    a: Int = 5;
    b: String = "x";
    c: Bool = true;
    d: Int?;         // implicitly null
    e: Bool? = false;

    init() {
        self.a = 10;
        self.b = "y";
        self.c = false;
        self.d = null;
        self.e = null;
    }
}
