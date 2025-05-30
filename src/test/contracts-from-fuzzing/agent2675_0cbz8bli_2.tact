struct NestedInner {
    innerVal: Int = 1;
}

struct NestedOuter {
    outerVal: Int = 2;
    nested: NestedInner;
}

contract TestContract {
    data: NestedOuter;
    init() {
        self.data = NestedOuter{
            nested: NestedInner{}
        };
    }
}