struct InnerMost {
    flag: Bool?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract MoreOptionalNesting {
    st: Outer;

    init() {
        self.st = Outer{
            middle: Middle{
                inner: InnerMost{
                    flag: false
                }
            }
        };
    }
}
