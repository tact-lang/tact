struct Inner {
    val: Int;
    flag: Bool;
}

contract OptionalInnerTest {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}