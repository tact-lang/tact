struct InnerStruct {
    foo: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    bar: Int;
}

contract TestContract {
    s: OuterStruct;
    
    init() {
        self.s = OuterStruct{
            inner: InnerStruct{ foo: 7 },
            bar: 9
        };
    }
}