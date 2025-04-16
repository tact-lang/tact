contract OnlyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;

    init() {
        self.oi = null;
        self.ob = false;
        self.os = "abc";
    }
}