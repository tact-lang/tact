struct F {
    x: Int;
}

contract OptionalDeepF {
    s: F?;
    init() {
        self.s = null;
    }
}