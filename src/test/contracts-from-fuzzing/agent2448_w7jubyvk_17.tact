struct OptionalStruct {
    s: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract DoubleOptionalInner {
    data: OptionalStruct;
    
    init() {
        self.data = OptionalStruct{
            s: null,
        };
    }
}
