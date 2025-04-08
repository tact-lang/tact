struct Inner {
    a: Int = 1;
    b: Bool = true;
}

contract NestedStructTest {
    val: Inner;

    init() {
        self.val = Inner{};
    }

    receive() {}
}