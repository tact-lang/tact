struct Inner {
    val: Int;
}

contract NestedInContract {
    i: Inner;

    init() {
        self.i = Inner{val: 999};
    }
}