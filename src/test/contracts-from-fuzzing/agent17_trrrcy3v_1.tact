struct NestedInner { x: Int; }

struct NestedOuter {
    inn: NestedInner;
}

contract DeepNestTest {
    inner: NestedOuter;
    
    init() {
        self.inner = NestedOuter{ inn: NestedInner{ x: 123 } };
    }
}