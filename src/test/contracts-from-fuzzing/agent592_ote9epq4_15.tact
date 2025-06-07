struct Inner {
    code: Int;
}

contract TestContract {
    info: Inner?;

    init() {
        self.info = Inner{code: 42};
    }

    receive() {}
}