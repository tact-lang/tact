contract OptionalInPersistent {
    p1: Int?;
    p2: Bool;

    init() {
        self.p1 = null;
        self.p2 = true;
    }
}