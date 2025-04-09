struct Wrap {
    x: Int;
}

contract OptionalStructWrap {
    val: Wrap?;
    init() {
        self.val = null;
    }
}