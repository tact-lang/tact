struct NestedInner {
    innerVal: Int;
}

struct NestedOuter {
    nested: NestedInner;
    flag: Bool;
}

contract UsesNestedStruct {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            nested: NestedInner{ innerVal: 5 },
            flag: true
        };
    }
}