contract OptionalInitCombo {
    a: Int?;
    b: Bool = false;
    c: String? = null;

    init() {
        self.a = 4;
        self.c = "s"
    }
}