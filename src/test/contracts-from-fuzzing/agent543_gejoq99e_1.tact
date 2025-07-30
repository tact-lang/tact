struct Inner {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{flag: true, num: 42};
    }
}
