struct Inner {
    x: Int = 1;
}

contract OptionalStruct {
    val: Inner?;
    init() {
        self.val = null;
    }
}