contract AllOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
    }
}