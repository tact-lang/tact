struct InnerS {
    x: Int;
}

struct OuterS {
    inner: InnerS?;
}

contract OptionalNestedStruct {
    state: OuterS;
    
    init() {
        self.state = OuterS{
            inner: InnerS{
                x: 77
            }
        };
    }
}
