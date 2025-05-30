struct DefInner {
    val: Int = 5;
}

struct DefOuter {
    inner: DefInner = DefInner{};
}

contract DefNestedTest {
    s: DefOuter;

    init() {
        self.s = DefOuter{};
    }
}
