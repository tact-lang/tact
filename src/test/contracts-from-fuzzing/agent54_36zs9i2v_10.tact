contract DefaultsAndOverrides {
    a: Int = 1;
    b: Bool;
    c: Int?;

    init() {
        self.b = true;
        self.c = null;
    }
}