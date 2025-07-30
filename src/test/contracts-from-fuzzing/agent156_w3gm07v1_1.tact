struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract DeepNestedTest {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true
            },
            flag: false
        };
    }
}