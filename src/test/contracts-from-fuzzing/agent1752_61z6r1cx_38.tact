contract OptionalInInitOnly {
    x: Int?;

    init() {
        self.x = 42;
    }
}