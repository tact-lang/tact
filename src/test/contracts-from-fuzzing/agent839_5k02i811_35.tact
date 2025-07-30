struct InnerYes {
    x: Int;
}

contract OptionalInner {
    val: InnerYes?;
    init() {
        self.val = null;
    }
}