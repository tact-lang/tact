struct Inner {
    x: Int;
    y: Int?;
}

contract DeepNestedTest {
    data: Inner;

    init() {
        self.data = Inner{
            x: 42,
            y: null,
        };
    }
}