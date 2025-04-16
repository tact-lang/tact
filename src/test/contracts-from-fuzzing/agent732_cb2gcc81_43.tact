struct InnerBoolNested {
    inside: Bool;
}

struct WrapInner {
    inner: InnerBoolNested;
}

contract DoubleNestedBool {
    data: WrapInner;
    
    init() {
        self.data = WrapInner{
            inner: InnerBoolNested{
                inside: true
            }
        };
    }
}