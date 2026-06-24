struct MiddleOpt {
    maybeInner: Int?;
}

contract OptionalMid {
    middle: MiddleOpt?;

    init() {
        self.middle = null;
    }
}