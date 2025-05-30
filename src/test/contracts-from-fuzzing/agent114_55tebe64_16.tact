struct Simple {
    x: Int;
}

struct DoubleWrap {
    inner: Simple?;
}

contract DoubleOptionTest {
    val: DoubleWrap?;

    init() {
        self.val = null;
    }
}