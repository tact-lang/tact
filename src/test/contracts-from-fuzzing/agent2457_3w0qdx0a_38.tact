struct DeepWrap {
    v: Int;
}

contract OptDeepWrap {
    val: DeepWrap?;
    init() {
        self.val = null;
    }
}