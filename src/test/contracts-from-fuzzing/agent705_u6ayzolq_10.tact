contract DefaultsAndOverrides {
    a: Int = 5;
    b: Bool = false;
    c: String = "Hello";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "World";
    }
}
