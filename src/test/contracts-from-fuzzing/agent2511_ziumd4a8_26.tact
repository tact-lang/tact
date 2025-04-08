contract OptSetLater {
    a: Int?;

    init() {
        self.a = null;
        self.a = 5;
    }
}