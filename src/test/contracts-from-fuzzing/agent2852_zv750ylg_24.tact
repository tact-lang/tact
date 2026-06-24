struct InnerBool {
    a: Bool;
}

contract OptionalInnerBool {
    s: InnerBool?;

    init() {
        self.s = null;
    }
}