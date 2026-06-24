contract OptionalBaseTypes {
    oi: Int?;
    ob: Bool?;
    os: String?;

    init() {
        self.oi = 11;
        self.ob = null;
        self.os = "test";
    }
}