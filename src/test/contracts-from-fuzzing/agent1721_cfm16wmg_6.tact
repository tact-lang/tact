struct NestedOptionals {
    inner: Int?;
}

struct HasNested {
    maybeInner: NestedOptionals?;
}

contract OptionalNestedTest {
    store: HasNested;

    init() {
        self.store = HasNested{
            maybeInner: NestedOptionals{
                inner: 999
            }
        };
    }
}