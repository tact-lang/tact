contract OptDefaults {
    iopt: Int?;
    bopt: Bool?;
    sopt: String? = "default";

    init() {
        self.iopt = null;
        self.bopt = null;
        self.sopt = null;
    }
}