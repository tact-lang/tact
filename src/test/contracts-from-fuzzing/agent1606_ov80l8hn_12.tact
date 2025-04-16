struct InnerMost {
    f: Int;
}

struct Middle {
    m: InnerMost;
}

struct Outer {
    o: Middle;
}

contract OverrideDeepDefaults {
    val: Outer;

    init() {
        self.val = Outer{
            o: Middle{
                m: InnerMost{
                    f: 999
                }
            }
        };
    }
}
