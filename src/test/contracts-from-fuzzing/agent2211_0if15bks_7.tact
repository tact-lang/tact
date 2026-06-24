struct InnerMost {
    val1: Int;
    val2: String;
    flag: Bool;
}

struct MiddleLayer {
    nestedOpt: InnerMost?;
    txt: String;
}

struct OuterLayer {
    m: MiddleLayer;
    n: Int;
}

contract NestedOptionStruct {
    bigField: OuterLayer;

    init() {
        self.bigField = OuterLayer{
            m: MiddleLayer {
                nestedOpt: null,
                txt: "abc",
            },
            n: 9
        };
    }
}