contract OptionalInits {
    p1: Int?;
    p2: String?;
    p3: Bool?;

    init() {
        self.p1 = null;
        self.p2 = null;
        self.p3 = null;
    }

    receive() {}
}