contract OnlyFields {
    f1: Int = 42;
    f2: Bool = true;
    f3: String = "str";
    f4: Int? = null;
    f5: Bool? = false;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "hey";
        self.f4 = 5;
        self.f5 = true;
    }
}
