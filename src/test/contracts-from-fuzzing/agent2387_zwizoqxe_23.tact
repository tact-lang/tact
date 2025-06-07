contract DefaultsAndOverride {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    init() {
        self.a = 10;
        self.b = false;
        self.c = 20;
        self.d = null;
    }
}