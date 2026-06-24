contract EdgeOptional {
    n: Int?;

    init() {
        self.n = null;
        self.n = 999;
    }
}