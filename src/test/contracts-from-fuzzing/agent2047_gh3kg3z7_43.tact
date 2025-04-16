struct OptSub {
    inner: Int?;
}

contract OptStructOptField {
    val: OptSub?;

    init() {
        self.val = null;
    }
}