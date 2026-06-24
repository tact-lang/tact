contract DefaultsOverride {
    a: Int = 1;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = 100;
        self.b = true;
        self.c = "override";
    }
}