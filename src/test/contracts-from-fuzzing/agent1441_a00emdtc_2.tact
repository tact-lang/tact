struct Inner {
    a: Int;
    b: Bool;
}

contract NestedTest {
    val: Inner;

    init() {
        self.val = Inner{a: 7, b: true};
    }

    receive() {
        self.val = Inner{a: 8, b: false};
    }
}