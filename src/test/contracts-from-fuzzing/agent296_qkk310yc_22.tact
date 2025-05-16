contract PrimitiveDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";

    init() {
        self.a = 10;
        self.b = true;
        self.c = "updated";
    }
}
