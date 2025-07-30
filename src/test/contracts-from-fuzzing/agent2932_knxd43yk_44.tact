contract UseDefaultsDirectly {
    a: Int = 9;
    b: Bool = true;
    c: String = "hey";
    init() {
        self.a = 1;
        self.b = false;
        self.c = "zzz";
    }
}