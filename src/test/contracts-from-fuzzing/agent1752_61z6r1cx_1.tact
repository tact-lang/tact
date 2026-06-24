struct Inner {
    val1: Int;
    flag: Bool;
}

contract NestedStructTest {
    nested: Inner;

    init() {
        self.nested = Inner{val1: 1, flag: true};
    }
}