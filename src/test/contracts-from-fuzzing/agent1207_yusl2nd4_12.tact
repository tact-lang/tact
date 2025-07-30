contract NullablePrimitives {
    ai: Int?;
    ab: Bool?;
    astr: String?;

    init() {
        self.ai = null;
        self.ab = false;
        self.astr = null;
    }
}