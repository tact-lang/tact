struct Inner {
    val1: Int;
    opt: Bool?;
}

contract NestedStructTest {
    s: Inner;

    init() {
        self.s = Inner{val1: 123, opt: null};
    }
}
