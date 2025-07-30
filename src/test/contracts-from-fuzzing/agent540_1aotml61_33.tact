contract DefaultsOnly {
    a: Int = 5;
    b: Bool = true;
    c: String = "Hello";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "World";
    }
}