contract OptionalSimple {
    maybeNum: Int?;
    maybeText: String?;

    init() {
        self.maybeNum = 123;
        self.maybeText = null;
    }
}