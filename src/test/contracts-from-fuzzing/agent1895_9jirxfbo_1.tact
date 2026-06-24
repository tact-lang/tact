struct NestedDeep {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    optVal: Int?;
}

contract DeepNestingTest {
    data: NestedDeep;
    
    init() {
        self.data = NestedDeep{
            inner: InnerStruct{ val1: 1, val2: true, optVal: null },
            optionalInner: null
        };
    }
}