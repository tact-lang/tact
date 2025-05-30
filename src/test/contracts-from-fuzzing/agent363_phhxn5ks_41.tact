struct Inner {
    a: Int;
    b: Int = 2;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{a:1};
    }

    receive() {}
}