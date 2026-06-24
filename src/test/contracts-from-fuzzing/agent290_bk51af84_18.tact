struct InnerMost {
    score: Int?;
}

struct Inner {
    deep: InnerMost?;
}

struct Outer {
    inr: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{
                deep: InnerMost{
                    score: 99
                }
            }
        };
    }
}