struct WrapperInt {
    val: Int;
}

contract OptionalOfWrapperTest {
    inner: WrapperInt?;

    init() {
        self.inner = WrapperInt{ val: 42 };
    }
}