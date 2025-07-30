struct InnerStruct {
    f1: Int;
    f2: Bool;
}

struct MiddleStruct {
    i: InnerStruct;
}

struct OuterStruct {
    m: MiddleStruct;
}

contract DeepEmbed {
    obj: OuterStruct;

    init() {
        self.obj = OuterStruct{
            m: MiddleStruct{
                i: InnerStruct{
                    f1: 1,
                    f2: false
                }
            }
        };
    }
}