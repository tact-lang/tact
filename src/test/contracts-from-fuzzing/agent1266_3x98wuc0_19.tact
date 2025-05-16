struct Later {
    n: Int;
}

struct MiddleOptional {
    maybeLater: Later?;
}

struct OuterMost {
    midOpt: MiddleOptional?;
}

contract OptionalInOptional {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            midOpt: null
        };
    }
}