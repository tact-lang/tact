struct InnerRec {
    val: Int?;
}

struct MiddleRec {
    inner: InnerRec?;
}

struct OuterRec {
    middle: MiddleRec?;
}

contract RecOptionalPtrs {
    outer: OuterRec?;

    init() {
        self.outer = OuterRec{
            middle: MiddleRec{
                inner: InnerRec{ val: null }
            }
        };
    }
}