contract DefaultInits {
    a: Int = 1;
    b: Bool = true;
    s: String = "Hello";

    init() {
        self.a = 2;
        self.b = false;
        self.s = "World";
    }
}