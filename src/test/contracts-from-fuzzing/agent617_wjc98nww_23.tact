contract DefaultAndNulls {
    ai: Int?;
    bi: Int = 3;
    ab: Bool?;
    str: String = "abc";

    init() {
        self.ai = null;
        self.ab = true;
    }
}
