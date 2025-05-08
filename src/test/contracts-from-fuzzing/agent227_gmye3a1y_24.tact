contract DefaultsOnly {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: String = "test";

    init() {
        self.a = 42;
        self.b = 100;
    }
}