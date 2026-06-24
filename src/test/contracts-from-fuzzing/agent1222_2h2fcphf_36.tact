contract OptToNull {
    o: Int?;

    init() {
        self.o = 123;
        self.o = null;
    }
}