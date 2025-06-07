contract OptionalCombinations {
    ai: Int?;
    ab: Bool?;
    as_: String?;

    init() {
        self.ai = null;
        self.ab = true;
        self.as_ = "optional";
    }
}