struct Inner {
    x: Int;
    y: Bool;
}

contract NestedTest {
    val: Inner;

    init() {
        self.val = Inner{
            x: 5,
            y: false,
        };
    }
}