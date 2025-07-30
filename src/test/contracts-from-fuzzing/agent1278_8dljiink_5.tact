struct InnerMost {
    z: Int;
}

struct Mid {
    midVal: InnerMost;
}

struct Outer {
    outerVal: Mid;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            outerVal: Mid{
                midVal: InnerMost{
                    z: 999,
                },
            },
        };
    }
}