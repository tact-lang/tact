struct OptInner {
    val: Int?;
}

struct OuterOpt {
    nested: OptInner?;
}

contract NullNestedTest {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            nested: null
        };
    }
}