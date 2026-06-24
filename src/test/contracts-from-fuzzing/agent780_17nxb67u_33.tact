contract PrimitiveDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = 12;
        self.b = true;
        self.c = "hello";
    }
}