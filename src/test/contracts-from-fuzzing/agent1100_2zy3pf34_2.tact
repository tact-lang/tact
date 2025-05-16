struct Inner {
    x: Int;
    y: Bool;
}

contract NestedTest {
    data: Inner;

    init() {
        self.data = Inner{
            x: 7,
            y: false
        };
    }
}
