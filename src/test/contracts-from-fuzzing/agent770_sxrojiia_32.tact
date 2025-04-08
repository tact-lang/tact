struct InnerMost {
    value: Int;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract TestContract {
    all: Outer;

    init() {
        self.all = Outer{
            mid: Mid{
                inner: InnerMost{
                    value: 5
                }
            }
        };
    }
}