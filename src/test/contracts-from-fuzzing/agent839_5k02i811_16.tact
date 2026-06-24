struct SInner {
    a: Int?;
    b: Bool;
}

contract ComposeOptionals {
    val: SInner?;
    init() {
        self.val = null;
    }
}