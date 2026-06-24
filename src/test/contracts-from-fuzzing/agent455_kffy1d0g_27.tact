struct WrapperBool {
    val: Bool;
}

contract OptNestedInside {
    s: WrapperBool?;
    init() {
        self.s = null;
    }
}