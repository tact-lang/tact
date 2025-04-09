contract BigMixed {
    a1: Int = 1;
    a2: Bool = true;
    a3: String = "x";
    a4: Int?;
    a5: Bool?;
    a6: String?;

    a7: Int = 7;
    a8: Bool = false;
    a9: String = "y";
    a10: Int?;
    a11: Bool?;
    a12: String?;

    init() {
        self.a4 = null;
        self.a5 = null;
        self.a6 = null;

        self.a10 = null;
        self.a11 = null;
        self.a12 = null;
    }
}