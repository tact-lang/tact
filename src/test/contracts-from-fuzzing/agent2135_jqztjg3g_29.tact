contract OptionalFlip {
    o: Int?;

    init() {
        self.o = null;
        self.o = 123;
        self.o = null;
    }
}