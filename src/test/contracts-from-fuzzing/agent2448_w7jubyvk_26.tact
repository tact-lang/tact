struct InnerMost {
    v: Int;
}

struct Middle {
    im: InnerMost;
}

struct OuterMost {
    mid: Middle;
}

contract DeepChain {
    val: OuterMost;
    
    init() {
        self.val = OuterMost{
            mid: Middle{
                im: InnerMost{
                    v: 88,
                }
            }
        };
    }
}
