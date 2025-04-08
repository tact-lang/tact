contract AllNulls {
    optional1: Int?;
    optional2: Bool?;
    optional3: String?;

    init() {
        self.optional1 = null;
        self.optional2 = null;
        self.optional3 = null;
    }
}