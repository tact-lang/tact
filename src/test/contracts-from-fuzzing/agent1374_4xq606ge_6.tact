struct InnerMost {
    leaf: String?;
}

struct Inner {
    innerMost: InnerMost?;
}

struct Outer {
    middle: Inner?;
}

contract TestContract {
    root: Outer;

    init() {
        self.root = Outer{
            middle: Inner{
                innerMost: InnerMost{
                    leaf: "deep optional",
                }
            }
        };
    }
}