struct S {
    x: Int;
    y: Bool;
}

contract OptOuterInnerDefaultNull {
    s: S?;
    init() {
        self.s = null;
    }
}