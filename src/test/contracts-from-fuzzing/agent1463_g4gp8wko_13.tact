struct OptDeepInner {
    a: Int?;
}

struct OptDeepOuter {
    inner: OptDeepInner?;
}

contract OptDeepChainTest {
    field: OptDeepOuter?;

    init() {
        self.field = null;
    }
}
