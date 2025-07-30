// 'remaining' suffix inside optional struct (should work)
struct OptRem {
    lead: Int;
    optSuffix: Slice as remaining;
}

contract RemInOpt {
    data: OptRem?;

    init() {
        self.data = null;
    }
}
