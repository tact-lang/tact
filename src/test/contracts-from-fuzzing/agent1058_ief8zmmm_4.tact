struct SOptInner {
    v: Int?;
}

struct SOptOuter {
    inner: SOptInner?;
}

contract NestedOptionalTest {
    val: SOptOuter;

    init() {
        self.val = SOptOuter{ inner: null };
    }
}