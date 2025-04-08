struct S1 {
    x: Int;
}

contract OptionalS1 {
    s: S1?;

    init() {
        self.s = null;
    }
}