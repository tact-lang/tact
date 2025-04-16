struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    myInner: Inner;

    init() {
        self.myInner = Inner{val1: 10, val2: true};
    }
}