struct InnerMost {
    val: Int?;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    i: Inner;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            i: Inner{
                im: InnerMost{ val: null }
            }
        };
    }
}