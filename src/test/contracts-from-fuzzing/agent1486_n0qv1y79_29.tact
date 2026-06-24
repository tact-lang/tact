struct OptInner {
    foo: Int?;
}

contract OptOptTest {
    nested: OptInner?;

    init() {
        self.nested = null;
    }
}