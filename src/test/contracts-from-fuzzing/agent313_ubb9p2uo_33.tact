contract OptionalInits {
    oi: Int?;
    os: String?;
    ob: Bool?;

    init() {
        self.oi = 100;
        self.os = null;
        self.ob = true;
    }
}