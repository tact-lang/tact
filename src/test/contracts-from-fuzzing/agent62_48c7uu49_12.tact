struct InnerMost {
    foo: Int;
}

struct InnerOpt {
    val: InnerMost?;
}

contract Test12 {
    nestedOpt: InnerOpt?;
    init() {
        self.nestedOpt = null;
    }
}