struct Inner {
    flag: Bool;
    count: Int;
    note: String;
}

contract OptionalInner {
    val: Inner?;

    init() {
        self.val = null;
    }
}