struct DeepInner {
    val1: Int;
    val2: Int?;
}

struct Inner {
    d1: DeepInner;
    d2: DeepInner?;
}

struct Outer {
    in1: Inner;
    in2: Inner?;
}

contract NestedStructsStore {
    nested: Outer;
    
    init() {
        self.nested = Outer{
            in1: Inner{
                d1: DeepInner{ val1: 1, val2: null },
                d2: null
            },
            in2: null
        };
    }
}