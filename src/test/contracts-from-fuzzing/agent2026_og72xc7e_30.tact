struct InnerNoDefaults {
    a: Int;
    b: Bool;
}

contract OptOuter {
    s: InnerNoDefaults?;

    init() {
        self.s = null;
    }
}