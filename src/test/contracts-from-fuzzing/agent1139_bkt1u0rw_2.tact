struct DeepNest {
    a: Int;
    b: Int?;
    c: InnerStruct;
}

struct InnerStruct {
    d: Int;
    e: Int?;
}

contract PersistDeepStruct {
    s: DeepNest;
    
    init() {
        self.s = DeepNest{
            a: 1,
            b: null,
            c: InnerStruct{
                d: 2,
                e: null,
            },
        };
    }
}