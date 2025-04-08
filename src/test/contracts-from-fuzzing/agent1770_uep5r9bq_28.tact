struct Inner {
    x: Int;
}

contract OptionalInnerAssigned {
    val: Inner?;

    init() {
        self.val = Inner{ x: 99 };
    }
}