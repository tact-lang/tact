struct InnerNest {
    intVal: Int;
    boolVal: Bool;
}

struct MiddleNest {
    inner1: InnerNest;
    optionalInner: InnerNest?;
}

struct OuterNest {
    middle: MiddleNest;
    optionalMiddle: MiddleNest?;
    stringVal: String;
}

contract DeepNestTest {
    nested: OuterNest;

    init() {
        self.nested = OuterNest{
            middle: MiddleNest{
                inner1: InnerNest{ intVal: 1, boolVal: true },
                optionalInner: null
            },
            optionalMiddle: null,
            stringVal: "deep"
        };
    }
}