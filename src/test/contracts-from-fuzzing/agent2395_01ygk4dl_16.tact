struct InnerMost {
    boolVal: Bool;
    intVal: Int;
}

struct InnerLayer {
    strVal: String;
    inner: InnerMost;
}

struct MiddleLayer {
    optInner: InnerLayer?;
    flag: Bool;
}

struct OuterStruct {
    midLayer: MiddleLayer;
}

contract DeepComplex {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            midLayer: MiddleLayer{
                optInner: InnerLayer{
                    strVal: "hello",
                    inner: InnerMost{ boolVal:true, intVal: 7 }
                },
                flag: false
            }
        };
    }
}
