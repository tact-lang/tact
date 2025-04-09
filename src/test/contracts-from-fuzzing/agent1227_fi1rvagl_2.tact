struct InnerMost {
    baz: Int;
}

struct InnerOpt {
    maybeInnerMost: InnerMost?; 
}

contract OptNestedContract {
    foo: Int = 1;
    optionalInner: InnerOpt?; 
    init() {
        self.optionalInner = null;
    }
}
