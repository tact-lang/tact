struct InnerMost {
    flag: Bool = true;
    value: Int?;
}

struct Middle {
    maybeInner: InnerMost?;
}

struct Outer {
    mid: Middle;
}

contract DeepOptionalTest {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{
                maybeInner: InnerMost{
                    value: null
                }
            }
        };
    }
}