struct MidOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalStructInner {
    middle: MidOpt?;

    init() {
        self.middle = null;
    }
}