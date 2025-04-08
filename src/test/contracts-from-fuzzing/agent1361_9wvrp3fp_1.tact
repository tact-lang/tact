struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    info: Inner;

    init() {
        self.info = Inner{a: 42, b: true};
    }
}