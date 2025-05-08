struct NestedInner {
    x: Int;
    y: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    optionalInner: NestedInner?;
}

contract DeepNestedTest {
    nestedField: NestedOuter;
    optionalNestedField: NestedOuter?;
    
    init() {
        let ni = NestedInner{ x: 1, y: true };
        self.nestedField = NestedOuter{ inner: ni, optionalInner: null };
        self.optionalNestedField = null;
    }
}