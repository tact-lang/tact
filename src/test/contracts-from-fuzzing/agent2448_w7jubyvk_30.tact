struct OptsInner {
    a: Int?;
    b: String?;
}

struct OptsOuter {
    inner: OptsInner?;
}

contract DoubleLevelOpt {
    val: OptsOuter;
    
    init() {
        self.val = OptsOuter{
            inner: null,
        };
    }
}
