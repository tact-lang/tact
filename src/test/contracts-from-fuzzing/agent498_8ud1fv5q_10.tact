contract ScalarDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
    o: Int?;
    init() {
        self.o = null;
    }
}