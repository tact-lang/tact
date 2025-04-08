struct S {
    a: Int;
    b: Bool;
}

contract OptStructField {
    s: S?;
    init() {
        self.s = null;
    }
}