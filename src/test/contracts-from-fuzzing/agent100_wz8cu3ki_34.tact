struct OuterStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    innerMost: InnerMostStruct;
}

struct InnerMostStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract Test35 {
    store: OuterStruct;

    init() {
        self.store = OuterStruct{
            inner: InnerStruct{
                innerMost: InnerMostStruct{ a:1, b:"hi", c:true }
            }
        };
    }
}