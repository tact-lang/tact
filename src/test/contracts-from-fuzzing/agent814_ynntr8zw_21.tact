contract DefaultOpt {
    v1: Int?;
    v2: Bool? = null;
    v3: String? = null;

    init() {
        self.v1 = null;
        self.v2 = true;
        self.v3 = "hi";
    }
}