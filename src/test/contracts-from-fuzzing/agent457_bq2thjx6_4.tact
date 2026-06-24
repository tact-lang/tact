struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inr: Inner;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            inr: Inner{
                im: InnerMost{ val: 42 }
            }
        };
    }
}