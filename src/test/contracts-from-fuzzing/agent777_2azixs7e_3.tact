struct InnerMost {
    z: Int;
}

struct Inner {
    mid: InnerMost;
}

struct Outer {
    deep: Inner;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            deep: Inner{
                mid: InnerMost{
                    z: 7
                }
            }
        };
    }
}