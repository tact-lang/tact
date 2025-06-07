contract DefaultsAndOverrides {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;

    init() {
        self.a = 99;
        self.b = "y";
        self.c = true;
    }
}