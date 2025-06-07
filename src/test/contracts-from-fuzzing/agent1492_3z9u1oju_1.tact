struct Inner {
    flag: Bool;
    val: Int;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            flag: true,
            val: 42,
        };
    }
}