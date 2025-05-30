contract SwitchingDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    s: String = "";
    o: String?;

    init() {
        self.b = null;
        self.d = null;
        self.o = null;
    }
}