struct InnerMost {
    leaf: Int;
}

struct Inner {
    next: InnerMost;
}

struct Middle {
    node: Inner;
}

struct Outer {
    root: Middle;
}

contract Cascade {
    top: Outer;

    init() {
        self.top = Outer{
            root: Middle{
                node: Inner{
                    next: InnerMost{
                        leaf: 4242
                    }
                }
            }
        };
    }
}