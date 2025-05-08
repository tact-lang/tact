struct InnerMost { val: Int; }
struct MidLevel { inner: InnerMost; }
struct OuterMost { mid: MidLevel; extra: Int; }

contract TwoBranches {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            mid: MidLevel{ inner: InnerMost{ val: 10 } },
            extra: 99
        };
    }
}
