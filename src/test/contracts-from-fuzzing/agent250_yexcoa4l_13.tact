struct Foo {
    a: Int;
    b: Bool;
}

contract OptionalStructTest {
    val: Foo?;

    init() {
        self.val = null;
    }
}