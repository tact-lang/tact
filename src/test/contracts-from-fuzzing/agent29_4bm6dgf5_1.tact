struct Inner {
    val: Int;
}

contract DeepOptionalTest {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}