struct Inner {
    val: Int;
}

struct Wrap {
    val: Inner?;
}

contract OptionalNestedTest {
    data: Wrap;

    init() {
        self.data = Wrap{};
    }
}