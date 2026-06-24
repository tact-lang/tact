contract OptionalStart {
    optA: Int?;
    normalB: Int = 2;

    init() {
        self.optA = null;
    }
}