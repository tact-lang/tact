contract SetNullLater {
    x: Int?;

    init() {
        self.x = 5;
        self.x = null;
    }
}