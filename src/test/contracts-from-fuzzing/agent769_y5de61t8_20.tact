struct InnerMost {
    x: Int;
}

struct InnerMid {
    mid: InnerMost;
}

struct InnerTop {
    top: InnerMid;
}

struct Outer {
    val: InnerTop;
}

contract DeepContract {
    deepField: Outer;

    init() {
        self.deepField = Outer{
            val: InnerTop{
                top: InnerMid{
                    mid: InnerMost{
                        x: 42
                    }
                }
            }
        };
    }
}