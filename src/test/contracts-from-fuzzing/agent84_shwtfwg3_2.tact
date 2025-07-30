struct Inner {
    val: Int;
}

contract TestContract {
    s: Inner? = null;

    init() {
        self.s = null;
    }
}