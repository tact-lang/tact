struct InnerMost {
    val1: Int;
    val2: Bool;
}

struct Middle {
    child: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepChain {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                child: InnerMost{
                    val1: 42,
                    val2: true,
                }
            }
        };
    }
}