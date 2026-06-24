struct OptInner {
    a: Int;
    b: Bool;
}

contract DirectNestedOpt {
    val: OptInner?;

    init() {
        self.val = null;
    }
}