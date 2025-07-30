struct Inner {
    x: Int;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{x: 10};
    }
}