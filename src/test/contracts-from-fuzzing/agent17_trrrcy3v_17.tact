struct SInner {
    x: Int?;
}

struct SOuter {
    i: SInner?;
}

contract OptionalNestedStructTest {
    val: SOuter;

    init() {
        self.val = SOuter{ i: null };
    }
}