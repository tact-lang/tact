contract PrimitiveDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = -1;
        self.b = true;
        self.c = "text";
    }
}