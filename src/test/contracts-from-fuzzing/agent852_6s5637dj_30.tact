struct SInner {
    b: Bool;
    s: String;
}

contract OptNestedInner {
    val: SInner?;

    init() {
        self.val = null;
    }
}