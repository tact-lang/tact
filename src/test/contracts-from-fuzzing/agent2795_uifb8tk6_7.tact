struct InnerOpt {
    data: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract OptionalNestings {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            mid: null
        };
    }
}