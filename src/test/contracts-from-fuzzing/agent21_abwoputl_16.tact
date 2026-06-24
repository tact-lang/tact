struct Details {
    score: Int;
    approved: Bool;
}

contract OptStructNull {
    info: Details?;

    init() {
        self.info = null;
    }
}
