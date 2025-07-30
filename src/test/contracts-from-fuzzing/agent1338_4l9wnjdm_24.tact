struct InnerMost {
    a: Int;
}

struct Middle {
    im: InnerMost;
}

struct OuterMost {
    m: Middle;
}

contract StructChain {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            m: Middle{
                im: InnerMost{ a:5 }
            }
        };
    }
}