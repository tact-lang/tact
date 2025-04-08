contract OnlyOptionals {
    oi: Int?;
    oi2: Int?;
    ob: Bool?;
    ob2: Bool?;
    os: String?;

    init() {
        self.oi = null;
        self.oi2 = 42;
        self.ob = true;
        self.ob2 = null;
        self.os = "str";
    }
}