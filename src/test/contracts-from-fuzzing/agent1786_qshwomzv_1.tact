struct Inner {
    x: Int;
    y: Bool?;
}

contract DeepTest {
    inner: Inner;
    num: Int = 7;

    init() {
        self.inner = Inner{
            x: 5,
            y: null,
        };
    }
}