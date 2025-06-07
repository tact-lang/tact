struct DeepNested {
    x: Int;
    y: Int;
}

struct NestedInner {
    ni1: Int;
    ni2: DeepNested;
}

contract TestNested {
    point: NestedInner;
    
    init() {
        self.point = NestedInner{ ni1: 5, ni2: DeepNested{ x: 1, y: 2 } };
    }
}