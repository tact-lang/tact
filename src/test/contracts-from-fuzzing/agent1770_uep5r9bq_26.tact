struct Inner {
    val: Int;
}

contract OptionalInnerStructDirect {
    item: Inner?;

    init() {
        self.item = null;
    }
}