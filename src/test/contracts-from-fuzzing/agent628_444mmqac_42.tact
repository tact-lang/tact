struct InnerMostOpt {
    z: Int?;
}

struct MiddleOpt {
    inner: InnerMostOpt?;
}

struct OuterOpt2 {
    mid: MiddleOpt?;
}

contract NestedOptionalStructs {
    val: OuterOpt2;
    init() {
        self.val = OuterOpt2{ mid:null };
    }
}