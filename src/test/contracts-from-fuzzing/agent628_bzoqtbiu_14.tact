struct InnerNested {
    x: Int;
    y: Int?;
}

struct OuterWithInner {
    z: Int;
    inner: InnerNested;
}

contract NestedPersistentStructTest {
    store: OuterWithInner;

    init() {
        self.store = OuterWithInner {
            z: -1,
            inner: InnerNested{ x: 5, y: null }
        };
    }
}