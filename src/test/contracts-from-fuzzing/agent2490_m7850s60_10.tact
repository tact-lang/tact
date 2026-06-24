struct OptOptInner {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: OptOptInner?;
    flag: Bool?;
}

contract NestedOptionalFieldTest {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}