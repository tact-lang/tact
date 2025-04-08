struct Inner {
    i: Int;
}

struct Middle {
    inr: Inner;
}

struct Outer {
    mid: Middle;
}

contract AccessChain {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Middle{
                inr: Inner{
                    i: 123
                }
            }
        };
    }
}