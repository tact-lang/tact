struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{a: 1, b: true};
    }
}
