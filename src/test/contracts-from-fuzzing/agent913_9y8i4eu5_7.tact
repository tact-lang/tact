struct InnerMost {
    v: Bool?;
}

struct Inner {
    f: InnerMost?;
}

struct Middle {
    g: Inner?;
}

contract TestContract {
    complex: Middle;
    init() {
        self.complex = Middle{
            g: Inner{
                f: InnerMost{
                    v: null
                }
            }
        };
    }
}