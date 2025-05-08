// 'remaining' suffix inside optional nested deep struct
struct InnerRem {
    payload: Slice as remaining;
}

struct Middle {
    lead: Int;
    nestedRem: InnerRem;
}

contract DeepOptRem {
    data: Middle?;

    init() {
        self.data = null;
    }
}
