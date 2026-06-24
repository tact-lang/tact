struct InnerOpt {
    val: Int?;
}

struct MiddleStruct {
    inner: InnerOpt;
}

struct OuterStruct {
    mid: MiddleStruct?;
}

contract NullOuterInnerOpt {
    val: OuterStruct;

    init() {
        self.val = OuterStruct {
            mid: null
        };
    }
}