struct NestedStruct {
    a: Int;
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    i: Int;
    b: Bool;
}

contract TestContract {
    s: NestedStruct;
    
    init() {
        self.s = NestedStruct{
            a: 1,
            b: true,
            inner: InnerStruct{
                i: 2,
                b: false,
            }
        };
    }
}