struct Inner {
    i1: Int;
    i2: Bool;
}

contract TestContract {
    nestedOpt: Inner? = null;
    receive() {
        self.nestedOpt = Inner{i1: 7, i2: false};
    }
}