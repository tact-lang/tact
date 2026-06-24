contract PrimitiveDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hey";

    init() {
        self.a = 2;
        self.b = true;
        self.c = "yo";
    }
}