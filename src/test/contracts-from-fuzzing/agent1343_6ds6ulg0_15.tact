contract OptionalInits {
    f1: Int?;
    f2: String?;

    init() {
        self.f1 = 5;
        self.f2 = null;
    }
}
