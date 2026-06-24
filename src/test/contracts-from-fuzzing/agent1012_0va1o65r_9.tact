struct InnerMost {
    a: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

struct Top {
    outer: Outer;
}

contract DeepNesting {
    top: Top;
    
    init() {
        self.top = Top{
            outer: Outer{
                inner: Inner{
                    innerMost: InnerMost{ a: 1 }
                }
            }
        };
    }
}