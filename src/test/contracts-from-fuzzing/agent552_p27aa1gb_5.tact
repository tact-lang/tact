struct InnerMost {
    value: Int?;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Mid{
                inner: InnerMost{ value: null }
            }
        };
    }
}