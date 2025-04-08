contract OptionalContract {
    start: Int?;
    mid: Int;
    end: Int?;
    init() {
        self.start = null;
        self.mid = 5;
        self.end = null;
    }
}