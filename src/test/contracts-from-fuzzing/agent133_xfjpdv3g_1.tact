struct NestedInner {
    value: Int;
}

struct NestedOuter {
    nested: NestedInner;
    flag: Bool;
}

contract DeepNestedTest {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            nested: NestedInner{value: 42},
            flag: true,
        };
    }
}