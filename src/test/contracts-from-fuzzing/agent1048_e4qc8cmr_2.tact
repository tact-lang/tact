struct Inner {
    value: Int;
}

contract TestContract {
    optionalInner: Inner?;

    init() {
        self.optionalInner = Inner{value: 42};
    }
}