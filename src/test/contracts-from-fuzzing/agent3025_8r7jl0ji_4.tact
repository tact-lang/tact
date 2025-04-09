struct Inner {
    val: Int;
}

contract TestContract {
    optionalInner: Inner?;

    init() {
        self.optionalInner = null;
    }
}