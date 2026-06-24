contract PrimitiveCombo {
    f1: Int = -42;
    f2: Bool = true;
    f3: String = "hello";
    f4: Int? = null;
    f5: String? = null;
    f6: Bool? = null;

    init() {
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
    }
}