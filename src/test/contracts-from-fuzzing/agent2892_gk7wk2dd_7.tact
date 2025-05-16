struct NestedOptStruct {
    optInner: Inner?;
}

struct Inner {
    foo: Int;
}

contract NullInnerInit {
    state: NestedOptStruct;
    init() {
        self.state = NestedOptStruct{ optInner: null };
    }
}