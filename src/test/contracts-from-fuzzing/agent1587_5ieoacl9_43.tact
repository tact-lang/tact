struct RecInner {
    s: String?;
}

contract RecOpt {
    r: RecInner?;

    init() {
        self.r = null;
    }
}