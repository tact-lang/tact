struct NestedInner {
    b: Int;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract DeepNestTest {
    val: NestedOuter;
    
    init() {
        self.val = NestedOuter{
            inner: NestedInner{b: 1},
            flag: true
        };
    }
}