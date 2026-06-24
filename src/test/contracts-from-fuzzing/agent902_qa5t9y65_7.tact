struct InnerMost {
    val: Int;
}

struct MiddleOpt {
    m: InnerMost?;
}

struct OuterOpt {
    n: MiddleOpt?;
}

contract OptionalNestedStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ n: null };
    }
}