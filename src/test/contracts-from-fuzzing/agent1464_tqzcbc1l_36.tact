message(0x1) InnerMsg {
    nestedInner: NestedInner?;
}

struct NestedInner {
    foo: Int? = null; 
}

struct UnionWrap {
    optMsg: InnerMsg?;
}

contract TestContract {
    data: UnionWrap?;

    init() {
        self.data = null;
    }
}