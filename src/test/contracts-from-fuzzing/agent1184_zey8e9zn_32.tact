struct InnerMost {
    z: Int?;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    i: Inner;
}

contract DeepNulls {
    data: Outer;

    init() {
        self.data = Outer{
            i: Inner{
                im: InnerMost{
                    z: null
                }
            }
        };
    }
}