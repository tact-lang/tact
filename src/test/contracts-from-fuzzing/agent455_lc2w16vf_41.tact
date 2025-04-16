contract BigPrimsAndOpts {
    v1: Int = 1;
    v2: Int?;
    v3: Bool = false;
    v4: Bool?;
    v5: String = "s";
    v6: String?;

    init() {
        self.v2 = 5;
        self.v4 = true;
        self.v6 = null;
    }
}