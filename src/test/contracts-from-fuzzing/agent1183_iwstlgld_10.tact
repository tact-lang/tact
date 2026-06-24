contract DefaultsAndOverride {
    a: Int = 10;
    b: Bool;
    c: String = "hello";

    init() {
        self.b = true;
        self.c = "world";
    }
}