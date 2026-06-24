struct InnerMost {
    f1: Int?;
    f2: Bool;
}

struct MiddleStruct {
    s1: InnerMost;
    s2: Int;
}

struct OuterStruct {
    s: MiddleStruct;
}

contract OptionalInsideNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            s: MiddleStruct{
                s1: InnerMost{ f1: null, f2: true },
                s2: 42
            }
        };
    }
}