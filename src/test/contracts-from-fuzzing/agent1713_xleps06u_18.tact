struct SInner {
    x: Int;
}

struct SMid {
    innerStruct: SInner;
}

struct SOuter {
    midStruct: SMid;
}

contract BigNestedStruct {
    data: SOuter;

    init() {
        self.data = SOuter{
            midStruct: SMid{
                innerStruct: SInner{ x: 99 }
            }
        };
    }
}