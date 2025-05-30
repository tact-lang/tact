// deeply nested optional struct with implicit nulls
struct InnerMostOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerMostOpt?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract DeepOptions {
    nestedOpt: OuterOpt;

    init() {
        self.nestedOpt = OuterOpt{
            mid: null
        };
    }
}