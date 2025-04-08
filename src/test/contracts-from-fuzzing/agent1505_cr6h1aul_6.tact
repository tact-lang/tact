contract DefaultsAndOverride {
    a: Int = 1;
    b: Bool = false;
    c: String = "text";
    d: Int?; // implicitly null

    init() {
        self.a = 10;
        self.b = true;
        self.c = "override";
        self.d = 42;
    }
}