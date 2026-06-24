struct Wrap {
    val: Int;
}

contract OptionalEmpty {
    boxed: Wrap?;
    num: Int;

    init() {
        self.boxed = null;
        self.num = 11;
    }
}