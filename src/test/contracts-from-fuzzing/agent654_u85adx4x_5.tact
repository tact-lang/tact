struct InnerMost {
    value: Int;
}

struct Middle {
    innerMost: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                innerMost: InnerMost{
                    value: 42,
                }
            }
        };
    }
}