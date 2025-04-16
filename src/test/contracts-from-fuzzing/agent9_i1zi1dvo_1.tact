struct InnerMost {
    val: Int;
}

struct Inner {
    optionalVal: InnerMost?;
}

contract NestedOptionalsTest {
    nested: Inner;
    
    init() {
        self.nested = Inner { optionalVal: null };
    }
}