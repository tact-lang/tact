contract SingleEmptyOptional {
    x: Int?;

    init() {
        self.x = null;
    }

    receive() {
        // no-op
    }
}