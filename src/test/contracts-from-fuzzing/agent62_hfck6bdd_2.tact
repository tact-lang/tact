struct Inner {
    foo: Int;
    bar: Bool;
}

contract NestedStructTest {
    val: Inner;

    init() {
        self.val = Inner { foo: 42, bar: true };
    }
}