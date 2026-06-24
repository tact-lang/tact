struct NestedOpt {
    x: Int?;
    y: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    z: Int;
}

contract Test2 {
    s: NestedOpt;
    
    init() {
        self.s = NestedOpt{
            x: null,
            y: true,
            inner: InnerStruct{ z: 42 }
        };
    }
}