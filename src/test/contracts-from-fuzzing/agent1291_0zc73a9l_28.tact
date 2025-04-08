contract WithDefaults {
    a: Int = 42;
    b: Bool = false;
    s: String = "hello";

    init() {
        self.a=10; self.b=true; self.s="world";
    }
}